# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Serge Ziryukin <ftrvxmtrx@gmail.com>
pkgname=split2flac-git
_pkgname=split2flac
pkgver=132.9e5f019
pkgrel=1
pkgdesc="Split flac/ape/wv/wav + cue sheet into separate tracks. Git version."
arch=(any)
url="https://github.com/ftrvxmtrx/split2flac"
license=(MIT)
depends=(cuetools shntool flac)
makedepends=(git)
conflicts=(split2flac)
optdepends=(
'aacgain:      adjust gain in m4a'
'enca:         automatically detect charset if not UTF8'
'faac:         split into m4a'
'flac:         flac replay gain support'
'flake:        faster FLAC encoding'
'mac:          split APE format'
'id3lib:       set tags in mp3 (unicode not supported)'
'imagemagick:  convert/resize album cover images'
'lame:         split into mp3'
'mutagen:      split into mp3'
'libmp4v2:     split into m4a'
'mp3gain:      mp3 volume normalization'
'mutagen:      tag mp3s with unicode support'
'ttaenc:       convert to TrueAudio'  
'vorbis-tools: split into ogg vorbis'
'vorbisgain:   ogg vorbis volume normalization'
'wavpack:      split WV')
source=("git+https://github.com/ftrvxmtrx/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	cd "$_pkgname"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 $_pkgname-bash-completion.sh \
		"$pkgdir/usr/share/bash-completion/completions/$_pkgname-bash-completion.sh"

	for i in split2mp3 split2ogg split2m4a split2wav; do
		ln -s split2flac "$pkgdir/usr/bin/$i"
	done
}
