# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: Michael Taboada <michael@2mb.solutions>
_pkgname=horseshoes
pkgname=horseshoes-git
pkgver=116
pkgrel=2
pkgdesc="Audio only game of horseshoes."
arch=('any')
url="https://github.com/2mb-solutions/horseshoes"
license=('unlicense')
depends=('speech-dispatcher' 'allegro')
makedepends=('gcc' 'git' 'git-lfs')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'flite: TTS support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git"
        "$_pkgname.desktop"
        "$_pkgname.sh")
install="${_pkgname}.install"
md5sums=('SKIP'
         '7be0952ea7c4286f9f64d39bd98f1497'
         '8f6e9504843af79b9a3761d833c2fdb9')

pkgver()
{
  cd "$_pkgname"
  git shortlog | head -n 1 | tr -Cd "[:digit:]"
}
 
build()
{
  cd "$_pkgname"
git submodule update --init
export LD_RUN_PATH='$ORIGIN/lib/'
if [ $# -eq 0 ]; then
g++ -static-libgcc -static-libstdc++ -O3 -I/usr/include/speech-dispatcher -I/usr/include -Igame-kit/allegro_stuff -Igame-kit/screen-reader -Igame-kit game-kit/allegro_stuff/sound.cpp game-kit/allegro_stuff/keyboard.cpp game-kit/screen-reader/screen_reader.cpp game-kit/allegro_stuff/dynamic_menu.cpp game-kit/menu_helper.cpp game-kit/misc.cpp game-kit/soundplayer.cpp play.cpp game.cpp -lallegro_ttf -lallegro_audio -lallegro_acodec -lallegro -lallegro_font -lspeechd -logg -lvorbis -lvorbisfile && mv a.out horseshoes
else
g++ -static-libgcc -static-libstdc++ -m32 -O3 -I/usr/include/speech-dispatcher -I/usr/include -Igame-kit/allegro_stuff -Igame-kit/screen-reader -Igame-kit game-kit/allegro_stuff/sound.cpp game-kit/allegro_stuff/keyboard.cpp game-kit/screen-reader/screen_reader.cpp game-kit/allegro_stuff/dynamic_menu.cpp game-kit/menu_helper.cpp game-kit/misc.cpp game-kit/soundplayer.cpp play.cpp game.cpp -lallegro_ttf -lallegro_audio -lallegro_acodec -lallegro -lallegro_font -lspeechd -logg -lvorbis -lvorbisfile && mv a.out horseshoes
fi
unset LD_RUN_PATH
}

package()
 {
  cd "$_pkgname"
  install -d "$pkgdir/opt/horseshoes"
install -m755 "horseshoes" "$pkgdir/opt/horseshoes"
cp -a sounds/ "$pkgdir/opt/horseshoes"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  }

# vim:set ts=2 sw=2 et:
