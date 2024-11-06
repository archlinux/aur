# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.13.1"
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
b2sums_x86_64=('81cdcb44ee750af49e9de23ea6083d84f4b38b264e0049b35d2bc8fdfd640f901f3e39f52f172aa8271d0c3eeac4c0d02367bde74a123d4cfb33881fd88c9169')
b2sums_i686=('83fa4a765c08c5e143f00ec56a9d12498cfb6e2982b207f49d3d76f6677bd7007a36d2e8857663de00f2c0dbe09672150c3a179f3dfdae9bb68d4678ed2ccda8')
b2sums_aarch64=('f225f32b343309dad16c4368bc75a93a96920e8ae1cd6c599fdfd1166edd4985b1b4ffb29431bfecfcd2fe2007fcdf73c5cbc483f888b806235b8cd580c2ebf5')
b2sums_armv7h=('9f1ae265b1883d33978597657b6ee9cff951a5b7f04ca2a6d4c0a9b3183d971b288fbb5f41bb04ab60a55604504388a4cca93e5ca48d8b94a8b507167f1a3cfd')

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
