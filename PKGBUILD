# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Artem Borisovskiy

pkgname="hydrogen-drumkits-flac"
pkgver=20180818
pkgrel=1
pkgdesc="Hydrogen drum kits (FLAC format)"
arch=(any)
url="http://hydrogen-music.org/downloads/"
license=('GPL2')
depends=('hydrogen')
makedepends=('flac' 'python' 'sox')
provides=('hydrogen-drumkits')
conflicts=('hydrogen-drumkits')
changelog=ChangeLog
_sourcebase="https://sourceforge.net/projects/hydrogen/files/Sound%20Libraries/Main%20sound%20libraries"
source=(
  'convert-samples.py'
  "$_sourcebase/3355606kit.h2drumkit"
  "$_sourcebase/BJA_Pacific.h2drumkit"
  "$_sourcebase/Boss_DR-110.h2drumkit"
  "$_sourcebase/circAfrique%20v4.h2drumkit"
  "$_sourcebase/Classic-626.h2drumkit"
  "$_sourcebase/Classic-808.h2drumkit"
  "$_sourcebase/ColomboAcousticDrumkit.h2drumkit"
  "$_sourcebase/DeathMetal.h2drumkit"
  "$_sourcebase/EasternHop-1.h2drumkit"
  "$_sourcebase/ElectricEmpireKit.h2drumkit"
  "$_sourcebase/ErnysPercussion.h2drumkit"
  "$_sourcebase/ForzeeStereo.h2drumkit"
  "$_sourcebase/Gimme%20A%20Hand%201.0.h2drumkit"
  "$_sourcebase/HardElectro1.h2drumkit"
  "$_sourcebase/HipHop-1.h2drumkit"
  "$_sourcebase/HipHop-2.h2drumkit"
  "$_sourcebase/K-27_Trash_Kit.h2drumkit"
  "$_sourcebase/Lightning1024.h2drumkit"
  "$_sourcebase/Millo-Drums_v.1.h2drumkit"
  "$_sourcebase/Millo_MultiLayered2.h2drumkit"
  "$_sourcebase/Millo_MultiLayered3.h2drumkit"
  "$_sourcebase/SF3007-2011-Set-03.h2drumkit"
  "$_sourcebase/Synthie-1.h2drumkit"
  "$_sourcebase/TD-7kit.h2drumkit"
  "$_sourcebase/Techno-1.h2drumkit"
  "$_sourcebase/The%20Black%20Pearl%201.0.h2drumkit"
  "$_sourcebase/TR808909.h2drumkit"
  "$_sourcebase/VariBreaks.h2drumkit"
  "$_sourcebase/YamahaVintageKit.h2drumkit"
)
md5sums=('7508aac4c4f75352c96f97509b13997a'
         '5dad41a4f0fb5a9fda0af98b9f553060'
         'cde7a74a06edde3b5f85435c29909891'
         'f528892879ee04621055c4a3f12166c1'
         'e9d8604d2089abc764e54d1f209900b7'
         '86dbdb8d2f9b12690e92211d36c6fe7d'
         'c08d5093fc28a30a7542f0c89493e807'
         'cb11827e185ab5a6906967901495884b'
         '0465025dcf6659657b773874d168c27b'
         '8750fcbe186e49a89bc18a9237ee6604'
         'df1bd778148cc25d8f63a8cc7aa91fcb'
         '0e96f5971d5db887a186d5739c12ab77'
         'c6cd87bf54e0a760c5f4fecbff979100'
         '0e381ae9e4e04a5eab1ce5e5dbc3dcd4'
         'f953edf3f4227d786df59b544370e379'
         '7f52d6ac56a31f5b618657d40d4eb86e'
         '217f38ebf2849b20ff3a5dca1994be08'
         'f445c60d4625a6bfe6bb9dbac1ac0aa7'
         '8bc8365a17b28ccc41213a0f2f82d869'
         '4c895d59c3bc5f3322d14789de345be2'
         '2da5b8ee87bce3e67464c61ba0b722dd'
         '79ca7360784ec72959aa07c3c584d76c'
         'f0b243f7bbc0c4c04977b2efa96a07b4'
         '33f02627ac1489e4ab52c5f078c538b9'
         '635274624e0a739c51b70f72a58cfcec'
         'f91912fc88361dd8954c11f2e602aa25'
         '3969810a3a9a8844ccc216802b7288ad'
         '1db9cce82fbdaebac1ab4608be5853ea'
         'a9c305829cd23c28ffd1647cb5c0bdfd'
         '8f63997dd789179fa009f84cc515fb3e')
_drumkitsdir="/usr/share/hydrogen/data/drumkits"
_drumkits=(
    '3355606kit'
    'BJA_Pacific'
    'Boss_DR-110'
    'circAfrique v4'
    'Classic-626'
    'Classic-808'
    'ColomboAcousticDrumkit'
    'DeathMetal'
    'EasternHop-1'
    'ElectricEmpireKit'
    'ErnysPercussion'
    'ForzeeStereo'
    'Gimme A Hand 1.0'
    'HardElectro1'
    'HipHop-1'
    'HipHop-2'
    'K-27_Trash_Kit'
    'Lightning1024'
    'Millo-Drums_v.1'
    'Millo_MultiLayered2'
    'Millo_MultiLayered3'
    'SF3007-2011-Set-03'
    'Synthie-1'
    'TD-7kit'
    'Techno-1'
    'The Black Pearl 1.0'
    'TR808909'
    'VariBreaks'
    'YamahaVintageKit'
)

build() {
  cd "${srcdir}"
  chmod +x convert-samples.py
  ./convert-samples.py "${_drumkits[@]}"
}

package() {
  install -d -m 755 "${pkgdir}${_drumkitsdir}"

  for drumkit in "${_drumkits[@]}"; do
    cp -rp "${srcdir}/${drumkit}" "${pkgdir}${_drumkitsdir}"
  done

  plain "Removing superfluous files..."
  find "${pkgdir}${_drumkitsdir}" -name LICENCE -delete
  find "${pkgdir}${_drumkitsdir}" -name "._*" -delete
  find "${pkgdir}${_drumkitsdir}" -type d -exec chmod 755 {} \;
  find "${pkgdir}${_drumkitsdir}" -type f -exec chmod 644 {} \;
}
