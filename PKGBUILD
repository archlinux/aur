# Maintainer: gulaghad <can6dev <AT> gmail <DOT> com>
pkgname=questofdungeons-hib
pkgver=1.1.0
pkgrel=2
pkgdesc="A turn based dungeon crawler game, a roguelike."
arch=('i686' 'x86_64')
url="http://www.questofdungeons.com/"
license=('custom: commercial')
depends=('freetype2' 'libvorbis' 'libgl' 'openal' 'sdl2')
conflicts=('questofdungeons')
source=('hib://QuestofDungeons_linux_'${pkgver}'.zip')
md5sums=('e36fe29b119b3bb60ed9091408de4c3e')

package() {
  cd "$srcdir/QuestofDungeons"

  install -d "$pkgdir/opt/QuestofDungeons"
  mv "GameResources" "$pkgdir/opt/QuestofDungeons"
  install -m755 "QuestofDungeons" "$pkgdir/opt/QuestofDungeons"

  if [ $CARCH == i686 ]; then
    install -d "$pkgdir/opt/QuestofDungeons/x86/libs"
    mv "x86/libs/libGLEW.so.1.10" "$pkgdir/opt/QuestofDungeons/x86/libs"
    mv "x86/QuestofDungeons" "$pkgdir/opt/QuestofDungeons/x86"
  elif [ $CARCH == x86_64  ]; then
    install -d "$pkgdir/opt/QuestofDungeons/amd64/libs"
    mv "amd64/libs/libGLEW.so.1.10" "$pkgdir/opt/QuestofDungeons/amd64/libs"
    mv "amd64/QuestofDungeons" "$pkgdir/opt/QuestofDungeons/amd64"
  fi

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/QuestofDungeons/QuestofDungeons" "$pkgdir/usr/bin/questofdungeons"
}
