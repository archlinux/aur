# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=daggerfall-fixes
pkgver=20120413
pkgrel=1
pkgdesc="The Elder Scrolls II: Daggerfall, unofficial fixes"
arch=('any')
url="http://www.uesp.net/wiki/Daggerfall:Files#Unofficial_Patches_and_Fixes"
license=('custom:daggerfall')
depends=("daggerfall")
makedepends=("unzip")
options=(!emptydirs)
install="fixes.install"
source=(http://images.uesp.net/9/9d/Fixqs001.zip
        http://images.uesp.net/6/6f/SPELLS.zip
        http://images.uesp.net/0/0c/BIOG00T0.zip
        http://images.uesp.net/d/d6/FACTFIX.ZIP
        http://images.uesp.net/e/ed/DF-POLITIC.PAK.zip
        http://images.uesp.net/0/0f/DFQFIX.ZIP
        http://images.uesp.net/9/95/Q0C00Y03.ZIP
        http://images.uesp.net/b/b9/Dark-elves.zip
        http://slushpool.dfworkshop.net/FILES/magicdef.zip
        andyfall-fixes.patch magical_effects_fix.patch)
noextract=(Fixqs001.zip SPELLS.zip BIOG00T0.zip FACTFIX.ZIP DF_POLITIC.PAK.zip
           Dark-elves.zip DFQFIX.ZIP Q0C00Y03.ZIP magicdef.zip)
md5sums=('4b8d31d14f3ee8c7400bdf8c9768aa1c'
         '1e7d295e27b3da4be5484ae6e898eaf9'
         '74a724074bf48b5cc64477d99f88f005'
         '42f248b13255d905148d448c2372732c'
         '1696cbc71f33d9d884a4d2d71b53649a'
         'fce596f801cd40115033bbeb0ccc20c4'
         '27d0a087d4972cfdb267e0ada4967862'
         '6b1bcf37ec70752f2704657e736356e4'
         '8162c3e6cdc7284b7238155cb5a732e8'
         'cf8264f3447f7801f40b394c0c91c459'
         'ed218728235b6e65c0ee896995f27bc5')

package() {
  cd "$srcdir"
  _target="${pkgdir}"/usr/share/games/daggerfall
  install -d -m775 "$_target"
  _target="$_target"/mods
  install -d -m775 "$_target"

  cd "$_target"
  install -d fixqs001-fixes/ARENA2
  cd fixqs001-fixes/ARENA2
  unzip "$srcdir"/Fixqs001.zip
  rm readme.pqs
  ls | while read file; do mv $file `echo $file | sed 's/.*/\U&/'`; done
  rm O0B1XY13.QBN
  rm O0B1XY13.QRC
  rm O0B2XY14.QBN
  rm O0B2XY14.QRC
  rm O0B3XY15.QBN
  rm O0B3XY15.QRC
  rm O0B4XY16.QBN
  rm O0B4XY16.QRC
  rm O0B50Y17.QBN
  rm O0B50Y17.QRC
  chmod -R a-w .
  cd "$_target"
  echo "fixqs001-fixes" > fixes.extends

  cd "$_target"
  install -d jumping_spell_fix/ARENA2
  cd jumping_spell_fix/ARENA2
  unzip "$srcdir"/SPELLS.zip
  cd "$_target"
  echo "jumping_spell_fix" >> fixes.extends

  cd "$_target"
  install -d magical_effects_fix/ARENA2
  cd magical_effects_fix/ARENA2
  unzip "$srcdir"/magicdef.zip
  rm README.TXT
  cd "$_target"
  cp "$srcdir"/magical_effects_fix.patch .
  echo "magical_effects_fix" >> fixes.extends
 
  cd "$_target"
  install -d mages_biography_fix/ARENA2
  cd mages_biography_fix/ARENA2
  unzip "$srcdir"/BIOG00T0.zip
  cd "$_target"
  echo "mages_biography_fix" >> fixes.extends

  cd "$_target"
  install -d faction_fix/ARENA2
  cd faction_fix/ARENA2
  unzip "$srcdir"/FACTFIX.ZIP
  rm README.TXT
  cd "$_target"
  echo "faction_fix" >> fixes.extends

  cd "$_target"
  install -d wrothgarian_enclave_fix/ARENA2
  cd wrothgarian_enclave_fix/ARENA2
  unzip "$srcdir"/DF-POLITIC.PAK.zip
  cd "$_target"
  echo "wrothgarian_enclave_fix" >> fixes.extends

  cd "$_target"
  install -d andyfall-fixes/ARENA2
  cd andyfall-fixes/ARENA2
  unzip "$srcdir"/Dark-elves.zip
  rm README.TXT
  rm -rf BAK
  cd "$_target"
  cp "$srcdir"/andyfall-fixes.patch .
  echo "andyfall-fixes" >> fixes.extends

  cd "$_target"
  install -d dfqfix/ARENA2
  cd dfqfix/ARENA2
  unzip "$srcdir"/DFQFIX.ZIP
  rm README.TXT
  rm STARTFIN.QBN
  rm STARTFIN.QRC
  rm STARTFIX.QBN
  rm STARTFIX.QRC
  cd "$_target"
  echo "fixqs001-fixes" > dfqfix.extends
  echo "dfqfix" >> fixes.extends

  cd "$_target"
  install -d extra_quests_patch-fixes/ARENA2
  cd extra_quests_patch-fixes/ARENA2
  unzip "$srcdir"/Q0C00Y03.ZIP
  cd "$_target"
  echo "extra_quests_patch-fixes" >> fixes.extends
}

