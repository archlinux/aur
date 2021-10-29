# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/FirefoxPWA/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

_pkgname="FirefoxPWA"
pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="1.2.1"
pkgrel=1
url="https://github.com/filips123/FirefoxPWA"
arch=("x86_64" "i686")
license=("MPL2")

depends=("glibc>=2.18")
optdepends=("firefox: Support for browser extension")
provides=("firefox-pwa")
conflicts=("firefox-pwa")
install=package.install

source_x86_64=("https://github.com/filips123/FirefoxPWA/releases/download/v${pkgver}/firefoxpwa_${pkgver}_amd64.deb")
source_i686=("https://github.com/filips123/FirefoxPWA/releases/download/v${pkgver}/firefoxpwa_${pkgver}_i386.deb")
sha256sums_x86_64=('c50448198697705a62810b22fb557149894aead969d9cd0a3fbd7290ff592c45')
sha256sums_i686=('167cd4e2b6cee53e78e602ba6b318c54926e826cef970d270546e334dcb047db')
b2sums_x86_64=('bb5d6876f2d3fd2230bbc46782ec8ad3eca5d32054477bd41ee608198293da4b25fdfa8effff7192689ece984508fc97ffdbdf26c2f6c9c78a17a235a3cdd10f')
b2sums_i686=('69a7f3e25c8e2e43bda1c8266cd2ba9a32e32f9909641e08831e0fedabed417c2f4387522c469b9ded224e5abc08a8f1a1a1aa85d440255bb2c03ae9d387a16e')

prepare() {
    # Extract data from DEB archive
    mkdir -p $srcdir/data/
    tar xf ${srcdir}/data.tar.xz -C $srcdir/data/

    # We don't use libexec on Arch
    sed -i "s@/usr/libexec/firefoxpwa-connector@/usr/lib/firefoxpwa/firefoxpwa-connector@g" $srcdir/data/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json
    mkdir -p $srcdir/data/usr/lib/firefoxpwa/
    mv $srcdir/data/usr/libexec/firefoxpwa-connector $srcdir/data/usr/lib/firefoxpwa/

    # Remove unnecessary directories
    rm -rf $srcdir/data/usr/libexec/
    rm -rf $srcdir/data/usr/lib64/
}

check() {
    cd $srcdir/data/
    [ "$(./usr/bin/firefoxpwa --version)" == "firefoxpwa $pkgver" ]
}

package() {
    cp -r $srcdir/data/* $pkgdir
}
