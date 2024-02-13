pkgname=extm3u
pkgver=20111201
pkgrel=1
_commit=8fcb71469ce0ca31fb1ee382842ada36a74de5a7
pkgdesc='Generates an extended .m3u playlist from mp3, mp4, ogg and flac files'
arch=(any)
url='https://www.splitbrain.org/projects/extm3u'
_url_source='https://github.com/splitbrain/extm3u'
license=(GPL-2.0-only)
depends=(perl perl-mp3-info)
optdepends=('perl-audio-flac-header: FLAC files support'
    'perl-mp4-info: MPEG-4 files support'
    'perl-ogg-vorbis-header-pureperl: OGG Vorbis files support'
)
source=("$_url_source/archive/$_commit.tar.gz" extm3u.patch)
sha256sums=('c39cd41953da3430dcb889f5dbc7852c6d3d4d09a2233ce7f57c4b39d84eda4f'
            '02389f5a9301a1faa0949876860f389ad86c59a68e0c45729fdcebdbda371f36')

prepare() {
  cd $pkgname-$_commit
  # apply some quality of life patches
  patch -p1 < ../extm3u.patch
}

package() {
  cd $pkgname-$_commit
  install -Dvm755 extm3u.pl "$pkgdir/usr/bin/$pkgname"
  install -Dvm644 README COPYING -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
