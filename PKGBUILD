# Maintainer: taotieren <admin@taotieren.com>
pkgname=spark-store
pkgver=3.0
pkgrel=2
pkgdesc="生态构建需要的不是某一方的单打独斗，而是人人行动起来，汇聚星火，产生燎原之势"
arch=('x86_64')
url="https://gitee.com/deepin-community-store/spark-store"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=('dpkg' 'qconf' 'dtkwidget' 'qt5-webengine' 'libnotify')
makedepends=('unzip' 'dpkg' 'qconf' 'dtkwidget' 'qt5-webengine' 'libnotify')
backup=()
options=('!strip')
source_x86_64=("${pkgname}.deb"'::https://gitee.com/deepin-community-store/spark-store/attach_files/552251/download/spark-store_3.0_amd64.deb')
sha256sums_x86_64=('c6004d4e48ab7b81ee78fef31863f4c31e82dd8d7256184173e746e21a6f985a')
source=("${pkgname}.zip"'::https://gitee.com/deepin-community-store/spark-store/repository/archive/3.0?format=zip')
sha256sums=('33992fc6f3b012e40a8b3014f877fd6144c8df718c98ad002430fe28794e5237')

prepare() {
    export LC_CTYPE="zh_CN.UTF-8"
    ar -x *.deb
        mkdir -p "${pkgname}-deb"
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgname}-deb"
    unzip "${srcdir}/${pkgname}.zip" -d "${srcdir}/${pkgname}-zip"
}

build() {
    export LC_CTYPE="zh_CN.UTF-8"
    cd "${srcdir}/${pkgname}-zip/${pkgname}"
    mkdir build && cd build && qmake .. && make
}

package() {
    cd "${srcdir}/${pkgname}-deb"
    cp --preserve=mode -r * "${pkgdir}/"
    install -dm755 "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/${pkgname}-zip/${pkgname}/build/src/${pkgname}" "${pkgdir}/opt/durapps/${pkgname}/bin/${pkgname}"
    ln -sf "/opt/durapps/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
