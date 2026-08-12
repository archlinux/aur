# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

pkgbase=fcitx5-pinyin-mihoyo-yukari0201
pkgname=()
pkgver=20260731 # renovate: datasource=github-releases depName=Yukari0201/fcitx5-pinyin-mihoyo
pkgrel=1
pkgdesc="Fcitx 5 / Rime / Rime Wanxiang Pinyin Dictionaries for miHoYo Games from wiki.biligame.com"
arch=('any')
url="https://github.com/Yukari0201/fcitx5-pinyin-mihoyo"
license=('CC-BY-SA-4.0')
source=(
    "${url}/releases/download/${pkgver}/genshin.dict"
    "${url}/releases/download/${pkgver}/honkai3rd.dict"
    "${url}/releases/download/${pkgver}/starrail.dict"
    "${url}/releases/download/${pkgver}/zenlesszonezero.dict"
    "${url}/releases/download/${pkgver}/genshin.dict.yaml"
    "${url}/releases/download/${pkgver}/honkai3rd.dict.yaml"
    "${url}/releases/download/${pkgver}/starrail.dict.yaml"
    "${url}/releases/download/${pkgver}/zenlesszonezero.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_genshin.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_honkai3rd.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_starrail.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_zenlesszonezero.dict.yaml"
)

sha256sums=('8d827919ff4fd789d0c297ec06a5dfef10737d144f7cb618af669ceae4c20f35'
            '99150a9be7da6761095e4ba0fee2c8d34883b9fb6cc9e5c0cc1044b09e0529cf'
            '7355a57b170f3ce23025ecaacd88111d16c170a1421d0a7a64634e5689e6c27f'
            '99150a9be7da6761095e4ba0fee2c8d34883b9fb6cc9e5c0cc1044b09e0529cf'
            'f040393267cd33475ccad02287a102ff59b222d29fea74dc11bd1cd0447361be'
            'e839f7e18fdb1cbde87cbccf2c02c25ee1295d3f52e55b7ab45387ec0dbf2eb7'
            '44f641133d08d73877522024fd95da4773cc7127fd9dc0b2f3c5f33f87f63124'
            '6ab28639d72052b03dc1d92744525013b0a765d4af9c8300e139d7a5fa82349b'
            'a7117b4fd3f12fb979bb8a7cc7337439b3397e1c312257df411b0d128daf8cfb'
            'd86dfbaf34ebe766691364a2afc19432b9881cdd34ba072a3d1fc84b44b5eca9'
            '9992413485e3a36eb3cc54da8b586f438d426972933a657901b657b31a28205b'
            '7663ea08364e6b57f20524f14fc213ec5eeea21a682a7011b30d2554d1bfa067')

# 游戏名
declare -A _games=(
    [genshin]="Genshin"
    [honkai3rd]="Honkai3rd"
    [starrail]="Starrail"
    [zenlesszonezero]="Zenless Zone Zero"
)

#
# 每个游戏拆三种词库，为避免与 AUR 上已有包重名，统一加 -yukari0201 后缀：
# - fcitx5-pinyin-<game>-yukari0201              Fcitx 5 词库
# - rime-pinyin-<game>-yukari0201                Rime 词库
# - rime-wanxiang-pinyin-<game>-yukari0201       Rime 万象拼音词库
#
for _game in "${!_games[@]}"; do
    _game_name=${_games[$_game]}

    # Fcitx 5 词库
    _pkgname="fcitx5-pinyin-${_game}-yukari0201" && pkgname+=("${_pkgname}")
    eval "package_${_pkgname}() {
        pkgdesc='${_game_name} Fcitx 5 Pinyin Dictionary from wiki.biligame.com'
        groups=('fcitx5-pinyin-mihoyo-yukari0201')
        install -Dm644 \"${_game}.dict\" -t \"\${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/\"
    }"

    # Rime 词库
    _pkgname="rime-pinyin-${_game}-yukari0201" && pkgname+=("${_pkgname}")
    eval "package_${_pkgname}() {
        pkgdesc='${_game_name} Rime Pinyin Dictionary from wiki.biligame.com'
        groups=('rime-pinyin-mihoyo-yukari0201')
        install -Dm644 \"${_game}.dict.yaml\" -t \"\${pkgdir}/usr/share/rime-data/\"
    }"

    # Rime 万象拼音词库
    _pkgname="rime-wanxiang-pinyin-${_game}-yukari0201" && pkgname+=("${_pkgname}")
    eval "package_${_pkgname}() {
        pkgdesc='${_game_name} Rime Wanxiang Pinyin Dictionary from wiki.biligame.com'
        groups=('rime-wanxiang-pinyin-mihoyo-yukari0201')
        install -Dm644 \"wanxiang_${_game}.dict.yaml\" -t \"\${pkgdir}/usr/share/rime-data/\"
    }"
done
