# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=split2flac
# upstream has gone read-only and this is the last commit
_commit=491591d21e2f97419e74751864b76b234b0fa2f1
pkgver=20200508
pkgrel=1
pkgdesc="Split flac/ape/wv/wav + cue sheet into separate tracks."
arch=(any)
url="https://github.com/ftrvxmtrx/split2flac"
license=(MIT)
depends=(cuetools shntool flac)
replaces=(split2flac-git)
eonflicts=(split2flac-git)
optdepends=(
'aacgain-cvs: to adjust gain in m4a'
'enca: to automatically detect charset if not UTF8'
'faac: to split into m4a'
'flac: for flac replay gain support'
'mac: to split APE format'
'id3lib: to set tags in mp3 unicode not supported'
'imagemagick: to convert/resize album cover images'
'lame: to split into mp3'
'libmp4v2: to split into m4a'
'mp3gain: mp3 volume normalization'
'python-mutagen: mp3 with unicode support within tags'
'vorbis-tools: to split into ogg vorbis'
'vorbisgain: ogg vorbis volume normalization'
'wavpack: to split WV')
source=("$pkgname-${_commit:0:7}.tar.gz::https://github.com/ftrvxmtrx/$pkgname/archive/$_commit.tar.gz")
b2sums=('65c31516835721b8bd4e554feb300e95bc07eee0b453da6245982f1211bd5ceb7f64e8e7d58b8f640d2b41e312f9b98e8ce3fbb863a1f6b19457a5d908153e5e')

package () {
	cd "$pkgname-$_commit"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 $pkgname-bash-completion.sh \
		"$pkgdir/usr/share/bash-completion/completions/$pkgname-bash-completion.sh"

	for i in split2mp3 split2ogg split2m4a split2wav; do
		ln -s split2flac "$pkgdir/usr/bin/$i"
	done
}
