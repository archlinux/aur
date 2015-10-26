# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgbase=scaleio
pkgname=( 'scaleio-gui' 'scaleio-gateway'
          'scaleio-sdc' 'scaleio-sds'
          'scaleio-mdm' 'scaleio-callhome'
          'scaleio-lia' 'scaleio-tb')
pkgver=1.32.2
pkgrel=5
pkgdesc="ScaleIO"
arch=('x86_64')
url="http://github.com/odeke-em/drive"
license=('Custom')
depends=('libaio' 'numactl' 'mutt' 'bash-completion' 'python2')
makedepends=('unzip' 'rpmextract')
conflicts=()
options=('!strip' '!emptydirs')
install=$pkgname.install
source=("http://downloads.emc.com/emc-com/usa/ScaleIO/ScaleIO_${pkgver}_Linux_SW_Download.zip")
sha256sums=('SKIP')

prepare() {
        cd $srcdir
        rm -rf ./ScaleIO_*_XEN_*_Download
        rm -rf ./ScaleIO_*_SLES_*_Download
        rm -rf ./ScaleIO_*_OpenStack_*_Download
        rm -rf ./ScaleIO_*_RHEL6_Download
        rm -rf ./ScaleIO_*_GPG-RPM-KEY_Download
        rm -rf ./ScaleIO_*Windows*_Download
        mv ./ScaleIO_${pkgver}_Gateway_for_Linux_Download/EMC-ScaleIO-gateway-*.noarch.rpm ./
        for i in ./ScaleIO_${pkgver}_Gateway_for_Linux_Download/*csv; do
                mv $i ./
        done
        rm -rf ./ScaleIO_${pkgver}_Gateway_for_Linux_Download
        mv ./ScaleIO_1.32.2_GUI_for_Linux_Download/*rpm ./
        rm -rf ./ScaleIO_1.32.2_GUI_for_Linux_Download/
        for i in ./ScaleIO_1.32.2_RHEL7_Download/*.rpm; do
                mv $i ./
        done
        rm -rf ./ScaleIO_1.32.2_RHEL7_Download/
}

package_scaleio-gui()
{
        pkgdesc="ScaleIO GUI"
        depends=('java-runtime')
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-gui
        cd ./scaleio-gui
        mv ../EMC-ScaleIO-gui-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/

        rm -rf ../scaleio-gui

        mkdir -p ${pkgdir}/usr/bin/
        echo '#!/bin/bash'                 >  ${pkgdir}/usr/bin/scaleio-gui
        echo '/opt/emc/scaleio/gui/run.sh' >> ${pkgdir}/usr/bin/scaleio-gui
        chmod +x ${pkgdir}/usr/bin/scaleio-gui

        install -Dm 755 ${srcdir}/../scaleio.png ${pkgdir}/usr/share/icons/scaleio.png
        install -Dm 755 ${srcdir}/../scaleio-gui.desktop ${pkgdir}/usr/share/applications/scaleio-gui.desktop
}

package_scaleio-gateway()
{
        pkgdesc="ScaleIO Gateway"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-gateway
        cd ./scaleio-gateway
        mv ../EMC-ScaleIO-gateway-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm

        for i in ../*csv; do
                mv $i ./opt/emc/scaleio/gateway/conf/
        done
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-gateway
}

package_scaleio-callhome()
{
        pkgdesc="ScaleIO callhome"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-callhome
        cd ./scaleio-callhome
        mv ../EMC-ScaleIO-callhome-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-callhome
}

package_scaleio-lia()
{
        pkgdesc="ScaleIO callhome"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-lia
        cd ./scaleio-lia
        mv ../EMC-ScaleIO-lia-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-lia
}

package_scaleio-tb()
{
        pkgdesc="ScaleIO tb"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-tb
        cd ./scaleio-tb
        mv ../EMC-ScaleIO-tb-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-tb
}

package_scaleio-sdc()
{
        pkgdesc="ScaleIO sdc"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-sdc
        cd ./scaleio-sdc
        mv ../EMC-ScaleIO-sdc-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-sdc
}

package_scaleio-sds()
{
        pkgdesc="ScaleIO sds"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-sds
        cd ./scaleio-sds
        mv ../EMC-ScaleIO-sds-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-sds
}

package_scaleio-mdm()
{
        pkgdesc="ScaleIO mdm"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-mdm
        cd ./scaleio-mdm
        mv ../EMC-ScaleIO-mdm-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-mdm
}
