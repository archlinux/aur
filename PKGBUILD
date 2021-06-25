# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: AshtonBRSC <michael@ashtonbrsc.co.uk>
# Contributor: pluckypigeon <pluckypigeon@ArchForums.com>
# Contributor: canton7

pkgname=get_iplayer-git
pkgver=3.27.r3.gabd6c84
pkgrel=1
pkgdesc="Download TV and radio programmes from BBC iPlayer"
arch=('any')
url="https://github.com/get-iplayer/get_iplayer"
license=('GPL3')
# perl-libwww is the LWP module
depends=('perl-json-pp'
         'perl-libwww'
         'perl-lwp-protocol-https'
         'perl-xml-libxml')
optdepends=('atomicparsley: metadata tagging for MP4 and M4A files'
            'ffmpeg: convert DASH audio/video, MPEG-TS, FLV files to MP4 and M4A'
            'perl-mojolicious: reduce cache update time')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --match "v*" --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -Dm755 $pkgname/get_iplayer $pkgname/get_iplayer.cgi -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/README.md -t "$pkgdir/usr/share/doc/get_iplayer"
  install -Dm644 $pkgname/get_iplayer.1 -t "$pkgdir/usr/share/man/man1"
}

