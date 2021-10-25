# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/FirefoxPWA/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

_pkgname="FirefoxPWA"
pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="1.2.0"
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
sha256sums_x86_64=('110968fb776a6ea2418cb97ce8c54105afaf0eddccb38f89922cfb5ce77cb4d2')
sha256sums_i686=('ad2da39d1b8eff3fe107b699178b43d4586e1f1733afc4812194440a30ee7f55')
b2sums_x86_64=('fa36feda153479415b5827d4b932385910fb9e1552e4181662af4c3fa31832923c34e0ac5236eb9309a17a44efda7715753c0d8d80d58fc6ea15802c8e42f4e1')
b2sums_i686=('2d3017de1e4ff4607ecaaedcef8cf0291e118952379663d3f277ef57d52c35f70175abbad741a27b537f86036b346961131d19b199dc9faed17cee0ab9b3fb87')

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
