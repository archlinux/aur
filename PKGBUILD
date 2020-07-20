# Maintainer: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.3.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('any')
license=('custom')
depends=('crypto++' 'zlib' 'sqlite' 'openssl' 'curl' 'c-ares' 'freeimage' 'libsodium'
         'readline' 'libmediainfo' 'pcre' 'ffmpeg' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="b2948c7c77862e99dee912f4fe321d3c6dac6b09"
source=("$pkgname.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
        "mega-sdk.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz")
sha512sums=('2fd3a3e76d3466d7b20c97a868f9af9d1189fa220e1f632bf37bd131a61f4db16f52fd8c7ff73875af98429d8e26106a16955350a8e92aeecd25c6d6c95de54c'
            '4033188310d7a987eba6b42869c32bdc189eb0e5ad1c71c504dc5e33936066fc2d1fd9308e029ca271a2946e05be284b05a5ce19440cc42d2faba64a65db189b')

prepare() {
  cd "MEGAcmd-${pkgver}_Linux"

  rm -r sdk
  ln -sf "../sdk-${_sdkhash}" sdk
}

build() {
  cd "MEGAcmd-${pkgver}_Linux"

  sh autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "MEGAcmd-${pkgver}_Linux"

  make DESTDIR="$pkgdir" install
}
