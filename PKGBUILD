# Contributor: Ramana Kumar <firstname@member.fsf.org>
pkgname=firefox-sync
pkgver=20150305
pkgrel=1
pkgdesc="Speed up Firefox using tmpfs"
arch=('i686' 'x86_64')
url="http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs"
license=('GPL')
depends=('rsync' 'firefox')
makedepends=('bash')
source=(${pkgname})
md5sums=('4e7949eaed8f284233d2ecdecc28534c')
package() {
  sed -i "3 c\
LINK=$(ls -d1 ~/.mozilla/firefox/*.default | head -n 1 | xargs basename)
" $pkgname
  install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  cd ${pkgdir}/usr/bin
  bash -c '{
echo "#!/bin/bash"
echo "firefox-sync && firefox && firefox-sync"
} > syncfox'
  find ${pkgdir}/usr/bin -type f -exec chmod 755 {} \;
  find ${pkgdir}/usr/bin -type d -exec chmod 755 {} \;
}
