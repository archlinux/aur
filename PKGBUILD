# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Contributor: Ryan Corder <ryanc@greengrey.org>

pkgname=palm-sdk
pkgver=3.0.5
pkgrel=2
pkgdesc="WebOS SDK: emulator-image, cmd-line tools, framework, samples, etc."
url="http://developer.palm.com/index.php"
arch=('i686' 'x86_64')
license=("custom")
depends=('java-environment>=6')
optdepends=('palm-novacom=1.0.80'
            'virtualbox<=4.1' 'virtualbox>=4.0: for emulator usage'
            'palm-sdk-oldimages: for emulator support of older phones')
options=(!strip)
source=("http://cdn.downloads.palm.com/sdkdownloads/${pkgver}.676/sdkBinaries/palm-sdk_${pkgver}-svn528736-pho676_i386.deb"
        "palm-sdk.install")
install='palm-sdk.install'

build() {

    cd $srcdir

    tar zxvf ${srcdir}/data.tar.gz -C $pkgdir

    rm -rf ${pkgdir}/usr/local
    rm -rf ${pkgdir}/usr/share

    mkdir ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

    ln -s /opt/PalmSDK/Current/share/documentation/legal/* ${pkgdir}/usr/share/licenses/${pkgname}

    ln -s /opt/PalmSDK/Current/bin/palm-{emulator,generate,install,launch,log,package,worm,run,help}     ${pkgdir}/usr/bin/
    # sdl-config conflicts with binary from 'sdl'
    #ln -s /opt/PalmPDK/Current/bin/{devprofile,nova-browser,pdk-device-install,pdk-ssh-init,sdl-config} ${pkgdir}/usr/bin/
}
sha1sums=('97b862a07e4631f60a28a2bdb4ff9f343be22e07'
          '4e4a352b78d887fce1d195604a434b9bd1d0ba0b')
