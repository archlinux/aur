# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.12.1"
pkgrel=1
url="https://pwasforfirefox.filips.si/"
arch=("x86_64" "i686" "aarch64" "armv7h")
license=("MPL2")

depends=("glibc>=2.18")
optdepends=("firefox: Support for browser extension")
provides=("firefox-pwa")
conflicts=("firefox-pwa")
install=package.install

source_x86_64=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_amd64.deb")
source_i686=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_i386.deb")
source_aarch64=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_armhf.deb")
b2sums_x86_64=('48e86e5c9be448b1506ff38014ed36485fc7b23276bb9c3b19b0d6377a53276da0d9fdcd3af63c6fa10cf274ad6a61f9bdfc4a493fd6fd168317d2eee8895487')
b2sums_i686=('9a5f7fd36b82223231eb41a0935080bfe64797d678c11cf0768d4b5bc613290d7592f5bd59475e37d9b82d3c6078ce8952cded7461c48f84f9069fbb3678345d')
b2sums_aarch64=('b3169673ce3ec93ceb8fd1643e5adddb7a625a453c337360ef83327cffaf5e60de02112d4d69405c89bf639090f92522158463cb7e866f246ea18c65da40b931')
b2sums_armv7h=('29a1505479fdb4a925383c998a6055e451118f89e6ab775fde5ac27e3fdaa7b925e5b9819c1eb1f5b04d5342d97c215b4a1769cf930627958e4af513cbd1bea5')

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
