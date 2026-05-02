# Maintainer: NekoLOvO <nekolying@gmail.com>

pkgbase=oh-my-rime-git
pkgname=(
    oh-my-rime-common-git
    oh-my-rime-all-git
    oh-my-rime-mint-git
    oh-my-rime-mint_flypy-git
    oh-my-rime-double_pinyin-git
    oh-my-rime-double_pinyin_abc-git
    oh-my-rime-double_pinyin_flypy-git
    oh-my-rime-double_pinyin_mspy_git
    oh-my-rime-double_pinyin_sogou-git
    oh-my-rime-double_pinyin_ziguang-git
    oh-my-rime-terra_pinyin-git
    oh-my-rime-wubi86_jidian-git
    oh-my-rime-wubi98_mint-git
)
pkgver=r327.a8b7555
pkgrel=3
arch=('any')
url="https://github.com/Mintimate/oh-my-rime"
license=('GPLv3')
depends=('librime-data')
makedepends=('git')
source=(
    "${pkgbase}::git+${url}.git"
    "rime-prelude::git+https://github.com/rime/rime-prelude.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${pkgbase}"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package_oh-my-rime-common-git() {
    pkgdesc="Rime配置：薄荷輸入法-Common Data"
    conflicts=('rime-emoji' 'rime-prelude' 'rime-stroke')
    provides=('rime-emoji' 'rime-prelude' 'rime-stroke')

    install -Dm644 "${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/dicts" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/lua" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/opencc" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/melt_eng.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/melt_eng.schema.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/radical_pinyin.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/radical_pinyin.schema.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/stroke.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/stroke.schema.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/symbols.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "rime-prelude/default.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "rime-prelude/punctuation.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "rime-prelude/key_bindings.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-all-git() {
    pkgdesc="Rime配置：薄荷輸入法"
    conflicts=(
        'rime-terra-pinyin'
        'oh-my-rime-mint-git'
        'oh-my-rime-mint_flypy-git'
        'oh-my-rime-double_pinyin-git'
        'oh-my-rime-double_pinyin_abc-git'
        'oh-my-rime-double_pinyin_flypy-git'
        'oh-my-rime-double_pinyin_mspy_git'
        'oh-my-rime-double_pinyin_sogou-git'
        'oh-my-rime-double_pinyin_ziguang-git'
        'oh-my-rime-terra_pinyin-git'
        'oh-my-rime-wubi86_jidian-git'
        'oh-my-rime-wubi98_mint-git'
    )
    provides=(
        'rime-terra-pinyin'
        'oh-my-rime-mint-git'
        'oh-my-rime-mint_flypy-git'
        'oh-my-rime-double_pinyin-git'
        'oh-my-rime-double_pinyin_abc-git'
        'oh-my-rime-double_pinyin_flypy-git'
        'oh-my-rime-double_pinyin_mspy_git'
        'oh-my-rime-double_pinyin_sogou-git'
        'oh-my-rime-double_pinyin_ziguang-git'
        'oh-my-rime-terra_pinyin-git'
        'oh-my-rime-wubi86_jidian-git'
        'oh-my-rime-wubi98_mint-git'
    )
    depends+=('oh-my-rime-common-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf ${pkgbase}/*.yaml "${pkgdir}/usr/share/rime-data"
    mv -f "${pkgdir}/usr/share/rime-data/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_all_suggestion.yaml"
    sed -i 's/^[[:space:]]*#[[:space:]]*- schema:/  - schema:/g' "${pkgdir}/usr/share/rime-data/oh_my_rime_all_suggestion.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/ibus_rime.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/weasel.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/squirrel.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/melt_eng.dict.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/melt_eng.schema.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/radical_pinyin.dict.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/radical_pinyin.schema.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/stroke.dict.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/stroke.schema.yaml"
    rm -rf "${pkgdir}/usr/share/rime-data/symbols.yaml"
}

package_oh-my-rime-mint-git() {
    pkgdesc="Rime配置：薄荷拼音-全拼輸入"
    depends+=('oh-my-rime-common-git' 'oh-my-rime-wubi98_mint-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_mint_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_mint_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: rime_mint" "${pkgdir}/usr/share/rime-data/oh_my_rime_mint_suggestion.yaml"
    cp -rf "${pkgbase}/rime_mint.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/rime_mint.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-mint_flypy-git() {
    pkgdesc="Rime配置：薄荷拼音-小鶴混輸"
    depends+=('oh-my-rime-common-git' 'oh-my-rime-wubi98_mint-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_mint_flypy_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_mint_flypy_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: rime_mint_flypy" "${pkgdir}/usr/share/rime-data/oh_my_rime_mint_flypy_suggestion.yaml"
    cp -rf "${pkgbase}/rime_mint_flypy.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-double_pinyin-git() {
    pkgdesc="Rime配置：自然碼雙拼-薄荷定製"
    depends+=('oh-my-rime-common-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: double_pinyin" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_suggestion.yaml"
    cp -rf "${pkgbase}/double_pinyin.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-double_pinyin_abc-git() {
    pkgdesc="Rime配置：智能ABC雙拼-薄荷定製"
    depends+=('oh-my-rime-common-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_abc_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_abc_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: double_pinyin_abc" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_abc_suggestion.yaml"
    cp -rf "${pkgbase}/double_pinyin_abc.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-double_pinyin_flypy-git() {
    pkgdesc="Rime配置：小鶴雙拼-薄荷定製"
    depends+=('oh-my-rime-common-git' 'oh-my-rime-wubi98_mint-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_flypy_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_flypy_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: double_pinyin_flypy" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_flypy_suggestion.yaml"
    cp -rf "${pkgbase}/double_pinyin_flypy.schema.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/radical_pinyin_flypy.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-double_pinyin_mspy_git() {
    pkgdesc="Rime配置：微軟雙拼-薄荷定製"
    depends+=('oh-my-rime-common-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_mspy_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_mspy_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: double_pinyin_mspy" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_mspy_suggestion.yaml"
    cp -rf "${pkgbase}/double_pinyin_mspy.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-double_pinyin_sogou-git() {
    pkgdesc="Rime配置：搜狗雙拼-薄荷定製"
    depends+=('oh-my-rime-common-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_sogou_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_sogou_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: double_pinyin_sogou" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_sogou_suggestion.yaml"
    cp -rf "${pkgbase}/double_pinyin_sogou.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-double_pinyin_ziguang-git() {
    pkgdesc="Rime配置：紫光雙拼-薄荷定製"
    depends+=('oh-my-rime-common-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_ziguang_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_ziguang_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: double_pinyin_ziguang" "${pkgdir}/usr/share/rime-data/oh_my_rime_double_pinyin_ziguang_suggestion.yaml"
    cp -rf "${pkgbase}/double_pinyin_ziguang.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-terra_pinyin-git() {
    pkgdesc="Rime配置：地球拼音-薄荷定製"
    conflicts=('rime-terra-pinyin')
    provides=('rime-terra-pinyin')
    depends+=('oh-my-rime-common-git' 'oh-my-rime-wubi98_mint-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_terra_pinyin_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_terra_pinyin_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: terra_pinyin" "${pkgdir}/usr/share/rime-data/oh_my_rime_terra_pinyin_suggestion.yaml"
    cp -rf "${pkgbase}/terra_pinyin.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/terra_pinyin.schema.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/terra_symbols.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-wubi86_jidian-git() {
    pkgdesc="Rime配置：五筆86-極點五筆"
    depends+=('oh-my-rime-common-git' 'oh-my-rime-mint-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_wubi86_jidian_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_wubi86_jidian_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: wubi86_jidian" "${pkgdir}/usr/share/rime-data/oh_my_rime_wubi86_jidian_suggestion.yaml"
    cp -rf "${pkgbase}/wubi86_jidian.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/wubi86_jidian.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}

package_oh-my-rime-wubi98_mint-git() {
    pkgdesc="Rime配置：五筆98-五筆小築"
    depends+=('oh-my-rime-common-git' 'oh-my-rime-mint-git')
    install=oh-my-rime.install

    mkdir -p "${pkgdir}/usr/share/rime-data"
    cp -rf "${pkgbase}/default.yaml" "${pkgdir}/usr/share/rime-data/oh_my_rime_wubi98_mint_suggestion.yaml"
    sed -i '/-[[:space:]]*schema:/d' "${pkgdir}/usr/share/rime-data/oh_my_rime_wubi98_mint_suggestion.yaml"
    sed -i "/^schema_list:/a \\  - schema: wubi98_mint" "${pkgdir}/usr/share/rime-data/oh_my_rime_wubi98_mint_suggestion.yaml"
    cp -rf "${pkgbase}/wubi98_mint.dict.yaml" "${pkgdir}/usr/share/rime-data/"
    cp -rf "${pkgbase}/wubi98_mint.schema.yaml" "${pkgdir}/usr/share/rime-data/"
}
