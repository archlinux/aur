# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=man-pages-openssh-ja
pkgver=7.3p1
pkgrel=1
pkgdesc="Japanese Man pages for the OpenSSH"
arch=('any')
url="http://euske.github.io/openssh-jman/"
license=('BSD')
source=('http://euske.github.io/openssh-jman/openssh-jman-730p1.tar.gz')
md5sums=('b621fa142c8b06a7a8bdcd98ec2ef9a0')

build() {
  cd ${srcdir}

  make
}

package() {
  install -D -m644 ${srcdir}/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -D -m644 ${srcdir}/*.html "${pkgdir}/usr/share/doc/${pkgname}/"

  cd $srcdir
  for i in 1 5 8; do
    if [ ! -e "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/" ]; then
      mkdir -p "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
      chmod 755 "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
    fi

    # To copy a noexistent man only.
    for f in *.${i} ; do
      if [ ! -e /usr/share/man/ja_JP.UTF-8/man${i}/${f}.gz ]; then
        cp ${f} "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/${f}"
        chmod 644 *.${i}
      fi
    done
  done
}
