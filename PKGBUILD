# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: AshtonBRSC <michael@ashtonbrsc.co.uk>
# Contributor: pluckypigeon <pluckypigeon@ArchForums.com>
# Contributor: canton7

_pkgname=get_iplayer
pkgname=$_pkgname-git
pkgver=2.95
pkgrel=1
pkgdesc="Download TV and radio programmes from BBC iPlayer"
arch=('any')
url="https://github.com/get-iplayer/get_iplayer"
license=('GPL3')

# perl-libwww is the LWP module
depends=('perl-libwww'
         'perl-xml-libxml'
         'perl-xml-simple'

         'perl-html-parser')

optdepends=(
  # Having only 'optdepends atomicparsley' is sufficient to install either atomicparsley or atomicparsley-largefile-hg.
  # However, added 'optdepends atomicparsley-largefile-hg' so 'pacman -Qi' will show 'atomicparsley-largefile-hg [installed]'
  'atomicparsley: MP4 and M4A files metadata tagging'
  'atomicparsley-largefile-hg: MP4 and M4A files metadata tagging (preferred)'
  'ffmpeg: FLV files to MP4, M4A, MP3 or AVI files'

  # Deprecated
  'perl-authen-sasl: Mail search results via SSL'
  'perl-mp3-info: Catalogue MP3 files in localfiles plugin'
  'perl-mp3-tag: MP3 files metadata tagging'
  'perl-net-smtp-ssl: Mail search results via SSL'
  'perl-net-smtp-tls: Mail search results via TLS'
  'perl-net-smtps: Mail search results via TLS (alternative)'
  'flvstreamer: Flash audio/video streams to FLV files. An "rtmpdump" alternative'
  'id3v2: MP3 files metadata tagging. Alternative "perl-mp3-tag" is preferred (full ID3 tagging)'
  'rtmpdump: Flash audio/video streams to FLV files')

makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
#source=($pkgname::git://github.com/get-iplayer/get_iplayer.git#branch=develop)
source=($pkgname::git://github.com/get-iplayer/get_iplayer.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --match "v*" --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  install -Dm755 get_iplayer "$pkgdir/usr/bin/get_iplayer"
  install -Dm755 get_iplayer.cgi "$pkgdir/usr/bin/get_iplayer.cgi"

  install -Dm644 README.md "$pkgdir/usr/share/doc/get_iplayer/README.md"

  install -Dm644 get_iplayer.1 "$pkgdir/usr/share/man/man1/get_iplayer.1"
}

