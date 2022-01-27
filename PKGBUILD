# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts-cjk-vf
pkgname=(noto-fonts-{cjk,{cjk-,}{hk,jp,kr,sc,tc}}-vf)
pkgver=20220121
pkgrel=1
pkgdesc='Google Noto CJK variable fonts'
url='https://www.google.com/get/noto/'
license=(custom:SIL)
arch=(any)
conflicts=(noto-fonts-cjk)
provides=(noto-fonts-cjk)
_commit=70dc26931fcfbed08afc8f683af108ee3027ad54
source=("noto-cjk-${pkgver}.tar.gz::https://github.com/googlefonts/noto-cjk/archive/${_commit}.tar.gz"
        70-noto-{cjk,hk,jp,kr,sc,tc}.conf)
sha256sums=('3e03522d5ee8ac0d8125eda48785c7afabbad81e20afb2e9da4403f00418535c'
            '357e9ed6553087567ec5a28f835db5c43d3cd68a688e4677f759cca465379a32'
            '70f5ad3bd3e3d90c98c6a9ea2f3a28c2564fe18f0d7b8d78926a284cec398fd0'
            '0b5bd14a869234e50b735505e96257cd8e0851031a02735353895b7408abd313'
            '233846410004447b718545aa83a5375400d5e3a0219e79ff0ab50a430aec765b'
            '099e5f2fff526d0d38d57ce5aa0ebd92e0886aaa937f77812f85d63d3e01e53c'
            '42d6a448bae63daba8eb6123a7b5e56683536f82709ed448a0b29c12bdf18e02')

_langs=(hk jp kr sc tc)

package_noto-fonts-cjk-vf(){
  cd noto-cjk-${_commit}

  for _font in Sans Serif; do
    install -Dm644 \
      ${_font}/Variable/OTC/Noto${_font}CJK-VF.otf.ttc \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}CJK.ttc

    # mono is available only for sans
    [ "${_font}" = "Sans" ] || continue
    install -Dm644 \
      ${_font}/Variable/OTC/Noto${_font}MonoCJK-VF.otf.ttc \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}MonoCJKCJK.ttc
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-cjk.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-cjk.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

_package_locl(){
  conflicts+=(noto-fonts-cjk-vf)
  provides+=(noto-fonts-cjk-vf)

  cd noto-cjk-${_commit}

  for _font in Sans Serif; do
    install -Dm644 \
      ${_font}/Variable/OTF/Noto${_font}CJK${_lang}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}CJK.otf

    # mono is available only for sans
    [ "${_font}" = "Sans" ] || continue
    install -Dm644 \
      ${_font}/Variable/OTF/Mono/Noto${_font}MonoCJK${_lang}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}MonoCJK.otf
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-cjk.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-cjk.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

_package_subset(){
  # the conflict is due to the multi-lingual mono font
  conflicts+=(noto-fonts-cjk-vf)
  provides+=(noto-fonts-cjk-vf)

  cd noto-cjk-${_commit}

  for _font in Sans Serif; do
    install -Dm644 \
      ${_font}/Variable/OTF/Subset/Noto${_font}${_lang^^}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto{_font}${_lang^^}.otf

    # mono is available only for sans
    [ "${_font}" = "Sans" ] || continue
    # there are no subset mono fonts, so install the multi-lingual with default locl
    install -Dm644 \
      ${_font}/Variable/OTF/Mono/Noto${_font}MonoCJK${_lang}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}MonoCJK.otf
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-${_lang}.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-${_lang}.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_noto-fonts-cjk-hk-vf(){
  pkgdesc+=' - Traditional Chinese HK as default language (OpenType locl)'

  _lang=hk
  _package_locl
}

package_noto-fonts-cjk-jp-vf(){
  pkgdesc+=' - Japanese as default language (OpenType locl)'

  _lang=jp
  _package_locl
}

package_noto-fonts-cjk-kr-vf(){
  pkgdesc+=' - Korean as default language (OpenType locl)'

  _lang=kr
  _package_locl
}

package_noto-fonts-cjk-sc-vf(){
  pkgdesc+=' - Simplified Chinese as default language (OpenType locl)'

  _lang=sc
  _package_locl
}

package_noto-fonts-cjk-tc-vf(){
  pkgdesc+=' - Traditional Chinese as default language (OpenType locl)'

  _lang=tc
  _package_locl
}

package_noto-fonts-hk-vf(){
  pkgdesc='Google Noto Traditional Chinese HK variable fonts'

  _lang=hk
  _package_subset
}

package_noto-fonts-jp-vf(){
  pkgdesc='Google Noto Japanese variable fonts'

  _lang=jp
  _package_subset
}

package_noto-fonts-kr-vf(){
  pkgdesc='Google Noto Korean variable fonts'

  _lang=kr
  _package_subset
}

package_noto-fonts-sc-vf(){
  pkgdesc='Google Noto Simplified Chinese variable fonts'

  _lang=sc
  _package_subset
}

package_noto-fonts-tc-vf(){
  pkgdesc='Google Noto Traditional Chinese variable fonts'

  _lang=tc
  _package_subset
}
