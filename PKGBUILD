# Maintainer: David Matson <gitcoder at outlook dot com>
pkgbase=freeswitch-sounds
pkgver=1.0.51
pkgrel=2
pkgdesc='Voice recordings for FreeSWITCH'
arch=('any')
url='https://freeswitch.org/'
license=('custom:none')
depends=('freeswitch-core')
options=('!strip')

pkgname=()
source=()

_sounds=(
         'en-ca:june:8000:8KHz Canadian English'
         'en-ca:june:16000:16KHz Canadian English'
         'en-ca:june:32000:32KHz Canadian English'
         'en-ca:june:48000:48KHz Canadian English'
         'en-us:callie:8000:8KHz US English'
         'en-us:callie:16000:16KHz US English'
         'en-us:callie:32000:32KHz US English'
         'en-us:callie:48000:48KHz US English'
         'fr-ca:june:8000:8KHz Canadian French'
         'fr-ca:june:16000:16KHz Canadian French'
         'fr-ca:june:32000:32KHz Canadian French'
         'fr-ca:june:48000:48KHz Canadian French'
         'pl-pl:espeak:8000:8KHz Polish (Poland):0.1.0'
         'pl-pl:espeak:16000:16KHz Polish (Poland):0.1.0'
         'pt-BR:karina:8000:8KHz Brazilian Portuguese'
         'pt-BR:karina:16000:16KHz Brazilian Portuguese'
         'pt-BR:karina:32000:32KHz Brazilian Portuguese'
         'pt-BR:karina:48000:48KHz Brazilian Portuguese'
         'ru-RU:elena:8000:8KHz Russian (Russia)'
         'ru-RU:elena:16000:16KHz Russian (Russia)'
         'ru-RU:elena:32000:32KHz Russian (Russia)'
         'ru-RU:elena:48000:48KHz Russian (Russia)'
         'sv-se:jakob:8000:8KHz Swedish (Sweden):1.0.50'
         'sv-se:jakob:16000:16KHz Swedish (Sweden):1.0.50'
         'sv-se:jakob:32000:32KHz Swedish (Sweden):1.0.50'
         'sv-se:jakob:48000:48KHz Swedish (Sweden):1.0.50'
         'zh-cn:sinmei:8000:8KHz Chinese (China)'
         'zh-cn:sinmei:16000:16KHz Chinese (China)'
         'zh-cn:sinmei:32000:32KHz Chinese (China)'
         'zh-cn:sinmei:48000:48KHz Chinese (China)'
         'zh-hk:sinmei:8000:8KHz Chinese (Hong Kong)'
         'zh-hk:sinmei:16000:16KHz Chinese (Hong Kong)'
         'zh-hk:sinmei:32000:32KHz Chinese (Hong Kong)'
         'zh-hk:sinmei:48000:48KHz Chinese (Hong Kong)'
)

for _sound in "${_sounds[@]}"; do
  OIFS=$IFS
  IFS=:; read -r -a _parts <<< "${_sound}"
  IFS=$OIFS

  _lang=${_parts[0]}
  _voice=${_parts[1]}
  _rate=${_parts[2]}
  _desc=${_parts[3]}
  _pkgver=${_parts[4]}

  if [ -z "$_pkgver" ]; then
    _pkgver=$pkgver
  fi

  _pkgname="freeswitch-sounds-${_lang,,}-$_rate"
  _file="freeswitch-sounds-$_lang-$_voice-$_rate-$_pkgver"

  pkgname+=($_pkgname)
  source+=("https://files.freeswitch.org/releases/sounds/$_file.tar.gz")
  eval "package_$_pkgname() {
    _package $_pkgname $_pkgver $_file \"$_desc\"
  }"
done

# Don't extract anything automatically (would use same directory).
noextract=("${source[@]##*/}")

# Force extraction of each source into a separate directory.
prepare() {
  for _s in ${source[@]##*/}; do
    _extract="${_s%%\.[^0-9]*}"
    mkdir -p $_extract
    tar -C $_extract -xf $_s
  done
}

_package() {
  pkgname="$1"
  pkgver="$2"
  pkgdesc="$4 voice recordings for FreeSWITCH"
  cd "$3"
  find . -type f -print0 | while IFS= read -r -d '' _f; do
   install -D -m644 "${srcdir}/$3/$_f" "${pkgdir}/usr/share/freeswitch/sounds/$_f"
  done
}

sha256sums=('9aaa9d73cfecfdab7a1fa2d63d65b922b86a405ebb9a31b09b15e58a2af9260a'
            '8d0091a2c98e5e06afea6bdd9f6cf2942e937786016037207b85757218b0f7a7'
            '8720b363995724792ff4723e1c8218ef95b27cb36208b7258f93bdda72123387'
            'd2fce478a95b8d9500a544a00253c81d7e9f639e21980bd689910fac87f30871'
            'e48a63bd69e6253d294ce43a941d603b02467feb5d92ee57a536ccc5f849a4a8'
            '324b1ab5ab754db5697963e9bf6a2f9c7aeb1463755e86bbb6dc4d6a77329da2'
            '06fd6b8aec937556bf5303ab19a212c60daf00546d395cf269dfe324ac9c6838'
            'cfc50f1d9b5d43cb87a9a2c0ce136c37ee85ac3b0e5be930d8dc2c913c4495aa'
            'eada67c61bd62ec420eb017df7524d10de286fba0c2da4800516b9f62c00e78c'
            'f942980ad359951ef3f69a324a3299ef86cdb4f8d2c62adaf73a1b95fb39fcc6'
            '8966a0c4daf666018cca6d8ba0f7708e251bed952b015d0ca6a0792341fe531b'
            'abaea558fb5485abdd01d0b1186e03cf508f96ac90492814cc7ed4475e99a1e0'
            '4bc7a772edde56d76f618fe4b33d71e47314cf36fc632c94a22d34dd581cbfc0'
            '824f28092913e3be8a042347b20bf0c425c7889de54cfa0740767c1431e66a93'
            'ba9b5d7f97675c560823a6f94804a6716dac66efe203dd1779952518c3944a77'
            '80432c1027f57e464cd899ed92216936cf48a3993dc1c168b1be2545b8f97aed'
            'e80a8653585cf9a4fe9cf1c0004279602542d15894ba13f2104d990cefdee567'
            '51ef9cac2dc4dd70d81c18f8e65bfd11de44207e8fac9961a68aa0d50d539870'
            'd2679503eb1f4dc1716df5f8c4b5a7b721f087b17e96a02b1a92480311074c66'
            'e5a354cd10401208291f1d0e668a8cf8215d3cdcb93f2cbd4b83dd134425e60b'
            'a2b43f20246f376d55dd73d269eb238cbeb6a961a40716d2f79a5835344aabfc'
            'ffd7d34907f6b6ac861e7898d2237ad763f242a17cd23811da28fd7745d3350d'
            'aa81c97b2954b36d5625d556d2c6764ee79d0c925284ba5ff4c60cb479936b48'
            '52da670c651ff598815aed655644b44b891ee158f4c67d048da90056a36ddcf6'
            '160de01069afa827c830595e521b53d95de4b415b48061fb843a1c4025fa17f2'
            '059889d75926b8e1f39e8d2c33f0e8f744a43c094bbe213a1caa9f26ae9a2799'
            '764985f39313426ef4a0ea4dd848f05faaced37b91b2c9a22f17d3f77235fae3'
            'd849a5818ac6630d7c572d728dcd48176a6877defd8c239cb12011528e95c2cd'
            '903fda016d2ac053ffe6bc2d4eaf816a66c8043ddc3383d48b7b14335d9ea98e'
            '95b9064acec13a0a32b15ea0b44dc408094b4d9dee84b183c5d9150a77e9bb23'
            '917d08c80969bdaf30f2a63a3b69f542b143614d42c6241503ac655d13864eb0'
            '0950e1d971b4f2ba4decd949406ccd0198fe9c686f246e175c70aafdf9783f30'
            '97d846ab06b5c84d2c46bec64560556acbfc88eb2080bd325b2c5259a5ae80d0'
            'bd605be7e536e11f8f67229a95513ef3f177263587c5bca75ccae647f43962a1')
