# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Marvin Lampe <marvin.lampe@gmx.de>

pkgname=get-flash-videos-git
_gitname=get-flash-videos
pkgver=1.25.99.02.r3.g5a4bf39
pkgrel=1
pkgdesc='Downloads videos from various Flash-based video hosting sites'
arch=('any')
url='https://github.com/monsieurvideo/get-flash-videos'
license=('APACHE')
depends=('perl-www-mechanize' 'perl-module-find' 'perl-term-progressbar')
makedepends=('git' 'perl')
optdepends=('rtmpdump: download videos over rtmp'
            'ffmpeg: play'
            'perl-xml-simple: Required for some sites'
            'perl-crypt-rijndael: Required for some sites'
            'perl-lwp-protocol-https: Required for some sites'
            'perl-lwp-protocol-socks: Required for some sites'
            'perl-data-amf: Required for some sites'
            'perl-compress-zlib: Required for some sites')
conflicts=('get_flash_videos' 'get-flash-videos')
provides=('get_flash_videos' 'get-flash-videos')
source=(git://github.com/monsieurvideo/get-flash-videos.git)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$_gitname"

  make
}

package() {
  cd "$_gitname"

  make install DESTDIR="$pkgdir"/ INSTALL_BASE=/usr \
    INSTALLSITELIB=/usr/lib/perl5/site_perl INSTALLSITESCRIPT=/usr/bin
}
