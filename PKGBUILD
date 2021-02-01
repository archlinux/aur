pkgname=ni-daqmx-base-bin
pkgver=15.0.0
pkgrel=1
pkgdesc="a subset of NI-DAQmx functionality for your data acquisition system"
arch=(x86_64)
url="https://www.ni.com/en-gb/support/downloads/drivers/download.ni-daqmx-base.html#326057"
license=(custom)
depends=(
)
makedepends=(
)
options=(!strip)      
source=("${pkgname}-${pkgver}.iso::https://download.ni.com/support/softlib/multifunction_daq/nidaqmxbase/${pkgver%.*}/linux/nidaqmxbase-${pkgver}.iso")
sha256sums=('594b1c07093be56fdfec783b224bd5db2c5509b95e0d30475dd5342b6efb97fa')

prepare(){
  rm -f *.i386.rpm
  rm *.iso
}

package(){
  install -d "${pkgdir}/opt/${pkgname}"
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
  for rpmf in *.rpm; do
    mv ${rpmf} ${rpmf}-ext
    mkdir "${pkgdir}/opt/${pkgname}/${rpmf}"
    pushd "${pkgdir}/opt/${pkgname}/${rpmf}"
    bsdtar -xvf "${srcdir}/${rpmf}-ext"
    popd
    rm -f ${rpmf}-ext
  done

  cp -a * "${pkgdir}/opt/${pkgname}"
}
