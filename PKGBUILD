# Maintainer: Ruben Agin <phabrics@phabrics.com>
pkgname=tme
pkgver=0.12rc10
pkgrel=1
pkgdesc="The Machine Emulator, or tme, provides a general-purpose framework for computer emulation."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://phabrics.com"
depends=('libvncserver' 'gtk4' 'sdl2')
source=("https://osdn.net/dl/nme/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e2c90f7c63de196c7bf52c9b06f17e2ab9db86fa86d8c3ff3ee2360fb20914f8')
options=('libtool')
install=$pkgname.install

build()
{
  cd "$pkgname-$pkgver"
  if test "x${CARCH}" = xx86_64; then
      ./configure --prefix=/usr --disable-ltdl-install --disable-recode
  else
      ./configure --prefix=/usr --disable-ltdl-install
  fi
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
