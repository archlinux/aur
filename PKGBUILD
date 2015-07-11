# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-ddnet
pkgver=7.8.2
pkgrel=1
pkgdesc="A customized version by DDRaceNetwork of this 2D shooting game"
arch=('i686' 'x86_64')
url="http://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2' 'openssl098')
optdepends=('teeworlds-ddnet-skins: extra skins')
makedepends=('gendesk')
provides=('teeworlds')
conflicts=('teeworlds')
         # PNG converted from DDNet.ico from https://github.com/def-/ddnet
source=(teeworlds-ddnet.png)
source_i686=("$url/downloads/DDNet-$pkgver-linux_x86.tar.gz")
source_x86_64=("$url/downloads/DDNet-$pkgver-linux_x86_64.tar.gz")
md5sums=('41465eb3a4ecf2e7f7afe5a5f0c84386')
md5sums_i686=('aac8cc25f58ef9f28f84d4f74b195071')
md5sums_x86_64=('4a553f227bec329cf1e3544b2de2d2d0')

# Check hashs manually (replace $pkgver):
# curl -sL http://ddnet.tw/downloads/md5sums | grep -E DDNet-$pkgver-linux

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
}

package() {
  cd DDNet-$pkgver-linux_*
  
    # Install binaries
  install -Dm755 DDNet "$pkgdir"/usr/bin/teeworlds-ddnet
  install -Dm755 DDNet-Server "$pkgdir"/usr/bin/teeworlds-ddnet_srv
  install -Dm755 dilate "$pkgdir"/usr/bin/dilate

    # Install data files
  mkdir -p "$pkgdir"/usr/share/teeworlds/data
  cp -r data/* "$pkgdir"/usr/share/teeworlds/data
  
    # Remove skins provided by teeworlds-ddnet-skins
  for skin in \
   "Ablush NeoN.png" "Apish Coke.png" "BadAnqelMonster.png" "Blind r0xr.png" \
   "DuMoH.png" "Evil Puffi.png" "Flying Silex.png" "Hidden Assassin.png"     \
   "Irradiated Sunny.png" "Mobys Skull.png" "PaladiN.png" "Red Coke.png"     \
   "Shadow.png" "Sonic.png" "Straw Crytek.png" "Terrorist.png" "Volt.png"    \
   "antiantey.png" "aqua.png" "bauer.png" "beast.png" "blacktee.png"         \
   "bomb.png" "bunny.png" "caesar.png" "chera.png" "clefairy.png"            \
   "demonlimekitty.png" "dino.png" "dragon.png" "draw.png" "emo.png"         \
   "evil.png" "evilwolfe.png" "fuzzy_coala.png" "ghost.png" "ghostjtj.png"   \
   "giraffe.png" "greensward.png" "greyfox.png" "greyfox_2.png"              \
   "hammie-chew.png" "hedgehog.png" "jeet.png" "kintaro_2.png" "kirby.png"   \
   "lightbulb.png" "m&mred.png" "m&myellow.png" "masterchief.png"            \
   "mermydon-coala.png" "mermydon.png" "mike.png" "monstee.png" "mouse.png"  \
   "musmann.png" "nanami.png" "nanas.png" "napoleon.png" "nersif.png"        \
   "nosey.png" "oldman.png" "oldschool.png" "penguin.png" "pepsi.png"        \
   "pikminpurple.png" "pikminwhite.png" "pikminyellow.png" "random.png"      \
   "red_bird.png" "roman.png" "savage.png" "t2.png" "tails.png" "tank.png"   \
   "tauren.png" "teerasta.png" "teledipsy.png" "telelaalaa.png" "telepo.png" \
   "teletinkywinky.png" "troll.png" "ts2_contest_skin.png" "tweety.png"      \
   "veteran.png" "voodoo_tee.png" "wartee.png" "whis.png"
  do
        rm "$pkgdir/usr/share/teeworlds/data/skins/$skin"
  done
  
    # Install desktop and icon files
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.png     "$pkgdir"/usr/share/pixmaps/$pkgname.png
  
    # Install license files
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
  install -Dm644 license_DDRace.txt "$pkgdir"/usr/share/licenses/$pkgname/license_DDRace.txt
}
