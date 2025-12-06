# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-bin
_pkgver=07.12.2025
pkgver="$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')"+alpha
pkgrel=5
pkgdesc='Free pixelart editor made in SDL3 C++'
url='https://github.com/counter185/voidsprite'
#_zip=voidsprite-${_pkgver}-linux-x86_64.flatpak.zip
# Hardcoding it temporarily. Will switch back to proper releases when those come out.
_appimage=https://github.com/counter185/voidsprite/releases/download/appimage-test/voidsprite-latest-x86_64-no-x.AppImage
#source=("https://github.com/counter185/voidsprite/releases/download/alpha${_pkgver}/${_zip}")
source=("voidsprite::$_appimage" "voidsprite.desktop" "license::https://raw.githubusercontent.com/counter185/voidsprite/refs/heads/main/LICENSE")
arch=('x86_64')
conflicts=('voidsprite')
provides=("voidsprite=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')")
sha256sums=('9e033fcebabdfd7b8e81ddcb45fe0ffc59a44d5c71960484f50327b102033def'
            'SKIP'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
noextract=('voidsprite')
depends=()
#makedepends=(unzip ostree sed)
makedepends=()
license=(GPL-2.0-only)
options+=('!strip')

# No more of this bullshit, we're using the appimage now.
# build() {
#     _repo=${srcdir}/voidsprite-repo
#     _src=${srcdir}/voidsprite-src
# 
#     unzip -o "${srcdir}/${_zip}"
#     rm -fr ${srcdir}/voidsprite-{repo,src}
#     ostree init --repo=${_repo} --mode=bare-user
#     ostree static-delta apply-offline --repo=${_repo} voidsprite-build-linux64-flatpak.flatpak
#     cd ${_repo} && \
#         ostree checkout --repo=${_repo} -U $(echo objects/*/*.commit | cut -d/ -f2- | tr -d / | cut -d. -f1) ${_src}
# 
#     # haha funny bin patch
#     sed -i -E 's/\/app\/share\/voidsprite/\/usr\/share\/voidsprite/g' ${_src}/files/bin/voidsprite
# }

package() {
    mkdir -p ${pkgdir}/usr/{bin,share/{applications,licenses/voidsprite}}
    install -m 755 ${srcdir}/voidsprite ${pkgdir}/usr/bin/voidsprite
    install -m 744 ${srcdir}/voidsprite.desktop ${pkgdir}/usr/share/applications/voidsprite.desktop
    install -m 744 ${srcdir}/license ${pkgdir}/usr/share/licenses/voidsprite/LICENSE
    # _src=${srcdir}/voidsprite-src

    # mkdir -p ${pkgdir}/usr
    # cp -r ${_src}/files/share ${pkgdir}/usr/share
    # mkdir ${pkgdir}/usr/bin
    # install -m 751 ${_src}/files/bin/voidsprite ${pkgdir}/usr/bin/voidsprite
    # _files="$(ls "${pkgdir}/usr/share/licenses")"
    # mkdir ${pkgdir}/usr/share/licenses/voidsprite
    # for x in $_files; do
    #     mv -vf ${pkgdir}/usr/share/licenses/${x} ${pkgdir}/usr/share/licenses/voidsprite/${x}
    # done
}

