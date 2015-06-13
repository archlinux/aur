# Contributor: Tom < tomgparchaur at gmail dot com >
pkgname=bassmod-xmms
pkgver=0.2
pkgrel=3
pkgdesc="A plugin for XMMS, using BASSMOD for playback, and UNMO3 for MO3 support"
arch=('i686' 'x86_64')
url="http://www.un4seen.com/bassmod.html"
license=('custom')
depends=('xmms')
source=("http://us.un4seen.com/files/${pkgname}.zip"
        'http://us.un4seen.com/files/bassmod20-linux.zip')
noextract=("${pkgname}.zip"
           'bassmod20-linux.zip')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
  /usr/bin/bsdtar -xf ${srcdir}/bassmod20-linux.zip
  /usr/bin/bsdtar -xf ${srcdir}/${pkgname}.zip
  make || return 1
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 libbassmod-xmms.so ${pkgdir}/usr/lib/xmms/Input/libbassmod-xmms.so || return 1
  install -Dm644 libbassmod.so ${pkgdir}/usr/lib/xmms/Input/libbassmod.so || return 1
  install -Dm644 BASSMOD.txt ${pkgdir}/usr/share/licenses/bassmod-xmms/bassmod.txt || return 1
}

md5sums=('f7bb90f7782ef96cf97d14d2a006afb5'
         'fa33074a2274dee787655dd31d17bc31')
