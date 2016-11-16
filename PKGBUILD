# Maintainer: Christian Zucchelli (@Chris_Zeta) <thewebcha@gmail.com>
pkgname=zscreen
pkgver=20150725
pkgrel=1.4
pkgdesc="Scrot and imgur/s3 upload zenity gui"
arch=('any')
url="https://github.com/ChrisZeta/Scrot-and-imgur-zenity-GUI"
license=()
makedepends=('git')
depends=('bash' 'curl' 'scrot' 's3cmd')
provides=('zscreen' 'zimgur' 'zs3upload')


_gitname=Scrot-and-imgur-zenity-GUI
_gitroot='https://github.com/ChrisZeta/Scrot-and-imgur-zenity-GUI.git'


package() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd $_gitname || return 1
    git pull || return 1
  else
    git clone $_gitroot || return 1
  fi
  msg " checkout done."

  cd $srcdir/$_gitname/src || return 1

  install -Dm755 zimgur.sh "${pkgdir}/usr/bin/zimgur"
  install -Dm755 zscreen.sh "${pkgdir}/usr/bin/zscreen"
  install -Dm755 zs3upload.sh "${pkgdir}/usr/bin/zs3upload"
 }



# vim:set ts=2 sw=2 et:
