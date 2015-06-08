# Contributor: Aleksey Frolov <aleks.lifey@gmail.com>
# Previous contributor: James Pearson <james.m.pearson+arch@gmail.com>
# Previous contributor: Xilon <xilonmu@gmail.com>

# gtkmm is not needed if you remove --enable-gui
# curl is not needed if you remove --enable-url, which allows loading a torrent directly from the web

pkgname=btg
pkgver=2.0.0.rc3
pkgrel=2
pkgdesc='Linux bittorrent client implemented in C++ and using the rasterbar libtorrent library.'
url='http://sourceforge.net/projects/btg/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libtorrent-rasterbar' 'gnutls' 'dialog' 'gtkmm>=2.6.0' 'curl')
options=('!libtool' '!emptydirs')
source=("http://downloads.sourceforge.net/project/btg/unstable/$pkgname-2.0.0-rc3.tar.gz")
md5sums=('17c6c37c2992f2a5fd3fc205f3fa834a')


build() {
  cd ${pkgname}-2.0.0

  ./autogen.sh

  ./configure --prefix=/usr \
    --enable-btg-config \
    --enable-session-saving \
    --enable-event-callback \
    --enable-command-list \
    --enable-upnp \
    --enable-gui \
    --enable-www \
    --enable-url \
    --with-boost-date-time=mt \
    --with-boost-filesystem=mt \
    --with-boost-thread=mt \
    --with-boost-regex=mt \
    --with-boost-program-options=mt
    #--enable-cli \

  make
}

package() {
  cd ${pkgname}-2.0.0

  make DESTDIR=${pkgdir} install
}
