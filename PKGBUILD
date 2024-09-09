# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.12.3"
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
b2sums_x86_64=('911199dc584388c3a93fe27d90744192dd1c0476e6d7ec4700574920cfa01aa2bd5a084aaefec228a8e8b160eca93e83dcc4d3aef069fd69bb6b38c745568103')
b2sums_i686=('ea0a5400c8bce8f2fe8328dac4476e304a4feb58604559215d1fb11ff7c67837e0e68e6da87ceca411b9500eddc061dfe5d9397ce6e519a6756540578345933c')
b2sums_aarch64=('0ee9abf09e92dd1ca6b2246b49b20d0aaf0a338ca58dcda067abb953a999a88cfdedd6f733e6421613ca4c3a443e0cc4f6674fd2751182e97240053037ed0d08')
b2sums_armv7h=('bdd90c4a0dc5c2a133c003596342b2987a5c8d31e5848c3756a2d3170345ea55fdd3222f193ac0646b62a08ccdcedfe58414ce886db491afd15385c3ef879ff4')

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
