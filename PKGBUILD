# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

pkgbase=fcitx5-pinyin-mihoyo-yukari0201
pkgname=()
pkgver=20260819 # renovate: datasource=github-releases depName=Yukari0201/fcitx5-pinyin-mihoyo
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

sha256sums=('c8521085b5b472af2521ec1790c809899a3d313dcb6613165dcc9bda915987f9'
            '99150a9be7da6761095e4ba0fee2c8d34883b9fb6cc9e5c0cc1044b09e0529cf'
            'd51d79affcf14ee9a3c8d68d29dfc30cba7071572127b0f5e71918e8b71610ff'
            '99150a9be7da6761095e4ba0fee2c8d34883b9fb6cc9e5c0cc1044b09e0529cf'
            '938a07fd6cbf684fe2025fae2d37f5c961330c1a379be10caa7b71c7cc3aca0d'
            '5864f4e95eba9303edd4153b14e2f75404b30ca091988cf2d98e041099af62fe'
            '64265c9a5ae16b7ddcdda67a5741182a37e54678274d05c3fe2e3a71a3bb09f0'
            '9abbea50de521f6260a6665a5453b0f7e999e640ac58a218a81675a848fb5a6e'
            '594d9a3a6ddb2448a1f2b6d6052f306eb0bfbac375f5d386d2f64d6184f1f20c'
            '2716f69dca19da742443c94d14790b5b94cc147610d5d6eeee1c640e9963383c'
            'cd04449287f255b5f1ff9610abb750cfb9db28041979af3fb8f0fea1e66e0381'
            '8080e2c08e536137e08d936feaa7fb238412b9f11cb94193a9c41be487fa1b74')

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
