# Maintainer: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>

epoch=1
_pkgbase=iceape
pkgbase=$_pkgbase-l10n
pkgver=2.46
pkgrel=1
pkgdesc="Language pack for Debian ${_pkgbase^}."
arch=('any')
url="https://wiki.parabola.nu/$_pkgbase"
license=('MPL' 'GPL')
depends=("$_pkgbase=$epoch:$pkgver")
makedepends=('unzip' 'zip')

_languages=(
  'be     "Belarusian"'
  'ca     "Catalan"'
  'cs     "Czech"'
  'de     "German"'
  'en-GB  "English (British)"'
  'es-AR  "Spanish (Argentina)"'
  'es-ES  "Spanish (Spain)"'
  'fi     "Finnish"'
  'fr     "French"'
  'gl     "Galician"'
  'hu     "Hungarian"'
  'it     "Italian"'
  'ja     "Japanese"'
  'lt     "Lithuanian"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'pl     "Polish"'
  'pt-PT  "Portuguese (Portugal)"'
  'ru     "Russian"'
  'sk     "Slovak"'
  'sv-SE  "Swedish"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=('brand.dtd' 'brand.properties' 'communicator-region.properties' 'editor-region.properties' 'messenger-region.properties' 'navigator-region.properties')
_url=https://ftp.mozilla.org/pub/seamonkey/releases/$pkgver/langpack

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=$pkgbase-${_locale,,}

  pkgname+=($_pkgname)
  source+=("$pkgbase-$pkgver-$_locale.xpi::$_url/seamonkey-$pkgver.$_locale.langpack.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})

_package() {
  pkgdesc="$2 language pack for Debian Iceape."
  replaces=(iceape-i18n-${1,,})
  conflicts=(iceape-i18n-${1,,})
  provides=(iceape-i18n-${1,,})

  unzip iceape-l10n-$pkgver-$1.xpi -d $1
  rm -v iceape-l10n-$pkgver-$1.xpi
  install -vDm644 $srcdir/brand.dtd $1/chrome/$1/locale/$1/branding
  install -vDm644 $srcdir/brand.properties $1/chrome/$1/locale/$1/branding
  install -vDm644 $srcdir/navigator-region.properties $1/chrome/$1/locale/$1/navigator-region/region.properties
  install -vDm644 $srcdir/messenger-region.properties $1/chrome/$1/locale/$1/messenger-region/region.properties
  install -vDm644 $srcdir/communicator-region.properties $1/chrome/$1/locale/$1/communicator-region/region.properties
  install -vDm644 $srcdir/editor-region.properties $1/chrome/$1/locale/$1/editor-region/region.properties
  sed -i -e 's/seamonkey/iceape/' $1/install.rdf
  rm -rv $1/chrome/$1/locale/$1/global-platform/{mac,win}

  cd $1
  zip -r langpack-$1@iceape.mozilla.org.xpi .
  mv -v langpack-$1@iceape.mozilla.org.xpi $srcdir
  cd ..
  rm -rv $1

  install -vDm644 langpack-$1@iceape.mozilla.org.xpi \
    "$pkgdir/usr/lib/iceape-$pkgver/extensions/langpack-$1@iceape.mozilla.org.xpi"
}

sha256sums=('21473f12638f447e573ce26d02297f9d966f61e04c5fcbb7fc30919a26a6c94b'
            'c01f71da0ed60a9a1e31325ca79ad3bf629496d42adb1871de756faa658db420'
            'd49655d6c7e6bbc16158d77a075f54b15b5740a6fe0cf9c6ea08df72ca44bcad'
            '41d8ae62c7af6b5e7168ba26a0b32e34e41a0357ed6e83a2097307c9b2e10afc'
            'dc8c43b153d063e099a50399b07069c4e00550f2826ad59d0eb14f6247801c03'
            '2118452fa650182eae694100711634021b7b1b574e285bd2f94902a9aa8533c2'
            'd97376ff92ffcdf04ec08273b60b8750d2c4f65edd71eed734313f72885f45db'
            '11adc88aab13826dbb7dd9374f877b80c87a085d75712c976173f243950292a6'
            '4fae0f46a8ba83a72e6c7a50b7ba73153f153055b874fa3e857ebf6867a48ff3'
            'e6d000492fbb3aa1f7624dbb3a546742bd9badb67a9cee8a95fd8b8ead7ac0eb'
            'be1e956e11c4e36def6af6ee0c0795f5ec19e4370d811b6f3fdf60ed38f184c4'
            '5b7a9da73fe69c9004487f844f97f5f18d3db79e49dd151ae9a6229545ef7d2c'
            'da0c4b4e156965310ad4280c5ab461abd778b89e55d16a1f1ee78f692bbb76cb'
            '9242710c283628b6e9f68eee0425e1f7b81d81be27c1d5c3dc441018751b1511'
            'e8e01037b879fe49e9dc042f27e08737083ac2bd7f9652ec2216d69f3de84ac9'
            'e10ed62becc1e090c1734434d4a48b403dadb75b2231b70b33e2f34666fa42fa'
            '7366d80af72e1e5c46275b0f3f4efa36290b59ac2c24dc4b2debf06dbdc469fe'
            '939162085a89575988fc44251f6f484bce087433bf06220fe94a3a3ef31a4279'
            'b3f8a0e23cbd3e235d33d1fb083ff6b5b4d0abdd4697d89be444f90e657afea5'
            '32ca1b4668234c96c161512e6e7a444d864229d86efdc89caafff5e1d882bd0d'
            '20b93b1f9475fc97a9f86f48d2bbcdeca43015c2cfe62a5a7b4d204dee1d7e0f'
            'eb9e84781c9c70411ccc199b8ccd6bf96729763ac09210d67d2dbe9178f9b8c4'
            '47a18be4d673bc8ef172b358512390d5bcfc6f81d1c2d327669aa135b2aec482'
            '0ba281071038143950c64a03edaab7a37a4d284ed1583b50633ab58e393c7743'
            'fd50c7fd8f291530f68af88424dffd15e59340cb854a1edc915d2d5dc548ec78'
            '124d643a414d595941cc5fd72c0529629df8f3ea15c0f16186e7e3d5550dca22'
            '6cadce5a8b40aaf1cc39157f5a9be3de5890d4b298082c11f9da1bdf43638869'
            '1ad81e539c119d4bcc9b4c15dc1a54d604ae8d999c3e7dbc112c2633dd914409'
            '50be5f1fc5bf46133308185fee7f6761eca90550bbbb6d27ded3a0f81e2cfb81'
            '19e835ebb01e3c7c8bdd3aeee9105f18187fb7c588bf2e329db45c39acb4e5dc'
            '2fe7403370d70d4daa6a302fc24fc72a062cb9777acc672faf20f51f2ed73955')
