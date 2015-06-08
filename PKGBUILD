# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Serge Ziryukin <ftrvxmtrx@gmail.com>
pkgname=split2flac-git
_pkgname=split2flac
pkgver=130.2bbf955
pkgrel=1
pkgdesc="Split flac/ape/wv/wav + cue sheet into separate tracks. Git version."
arch=('any')
url=("https://github.com/ftrvxmtrx/split2flac")
license=('MIT')
depends=('cuetools' 'shntool' 'flac')
makedepends=('git')
conflicts=('split2flac')
optdepends=('aacgain:      to adjust gain in m4a'
'enca:         to automatically detect charset if not UTF8'
'faac:         to split into m4a'
'flac:         for flac replay gain support'
'flake:        faster FLAC encoding'
'mac:          to split APE format'
'id3lib:       to set tags in mp3 (unicode not supported)'
'imagemagick:  to convert/resize album cover images'
'lame:         to split into mp3'
'mutagen:      to split into mp3'
'libmp4v2:     to split into m4a'
'mp3gain:      mp3 volume normalization'
'mutagen:      to set tags in mp3 (with unicode support)'
'ttaenc:       to convert to TrueAudio'  
'vorbis-tools: to split into ogg vorbis'
'vorbisgain:   ogg vorbis volume normalization'
'wavpack:      to split WV')
source=("git://github.com/ftrvxmtrx/$_pkgname.git")
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
