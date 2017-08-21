# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: AshtonBRSC <michael@ashtonbrsc.co.uk>
# Contributor: pluckypigeon <pluckypigeon@ArchForums.com>
# Contributor: canton7

_pkgname=get_iplayer
pkgname=$_pkgname-git
pkgver=3.02
pkgrel=1
pkgdesc="Download TV and radio programmes from BBC iPlayer"
arch=('any')
url="https://github.com/get-iplayer/get_iplayer"
license=('GPL3')

# perl-libwww is the LWP module
depends=('perl-libwww'
         'perl-lwp-protocol-https'
         'perl-xml-libxml')

optdepends=(
  'atomicparsley: metadata tagging for MP4 and M4A files'
  'atomicparsley-largefile-hg: metadata tagging for MP4 and M4A files (preferred)'
  'ffmpeg: convert DASH audio/video, MPEG-TS, FLV files to MP4 and M4A'
  'perl-mojolicious: reduce cache update time')

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

