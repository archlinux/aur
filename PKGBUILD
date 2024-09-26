# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.12.5"
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
b2sums_x86_64=('29f65a5bbd9bf9a3ba21402b8b11916576efd6840f105c2eb6e3e330a293391fb22d2f690da2182c2219f8752350136de62052e60cac51923b5bb6cadeb87e19')
b2sums_i686=('1172a27db7af4c05580ff507964cc8afae707245fc373b79c902e40f3f0480032a2d124a6e0b34da6095899432d290747f6d8dedfd3684570d6d135249004657')
b2sums_aarch64=('ed6b7aee318908628920d52daa0cbab50eb55ef1002597a7b35860bde33d91b3546481fd122d362b798ca8d550859837be8741712bcd10df70819a40306ef064')
b2sums_armv7h=('d78cd0881b41c58367ed991ba9e2c5c090c993c0670406527dffe1028a0e1d07834121a0c74138467b6d2851790509ff67628f396866326d68956b0fd7235846')

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
