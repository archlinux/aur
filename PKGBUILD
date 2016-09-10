# Maintainer: Dan Bright <productions at zaziork dot com>
pkgname=videotagger
pkgrel=2 # package release (reset to 1 when new package version released (pkgver)
pkgver=0.1.3.r17 # package version (increment when new application version released,  but overwritten on build with pkgver() method below)
pkgdesc="NOTE: THIS IS BETA. USE AT YOUR OWN RISK. GTK 3.x research tool application to take timestamped tags/notes of streamed or locally played video clips. The application controls and uses MPV player."
arch=('any')
url="https://github.com/ZWS2014/VideoTagger"
license=('GPL3')
depends=('python>=3.0.0' 'python-gobject' 'git' 'libyaml' 'mpv' 'python-pip' 'python-yaml')
source=("VideoTagger::git+https://github.com/ZWS2014/VideoTagger")
#source=($pkgname-$pkgver.tar.gz)
sha256sums=('SKIP')
pkgver() {
cd "$srcdir/VideoTagger/VideoTagger"
#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
printf "%s.r%s" "$(cat VideoTagger/VERSION.rst)" "$(git rev-list --count HEAD)" # reading from included version file ensures version matches with the published PyPi package version
}
#prepare() {
#}
package() {
mv $srcdir/VideoTagger/VideoTagger $srcdir/VideoTagger/VideoTagger-$pkgver
cd "$srcdir/VideoTagger/VideoTagger-$pkgver"
PIP_CONFIG_FILE=/dev/null
pip install --root="$pkgdir/" --isolated "$srcdir/VideoTagger/VideoTagger-$pkgver/dist/"*.whl
install -Dm644 "$srcdir/VideoTagger/VideoTagger-$pkgver/VideoTagger/resources/videotagger.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
install -Dm644 "$srcdir/VideoTagger/VideoTagger-$pkgver/VideoTagger/resources/videotagger_icon_256x256.png" "$pkgdir/usr/share/pixmaps/videotagger_icon_256x256.png"
}
post_install() {
update-desktop-database -q
}
post_remove() {
update-desktop-database -q
}
