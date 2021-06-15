# Maintainer: taotieren <admin@taotieren.com>
pkgname=spark-store
pkgver=3.0.2
pkgrel=1
pkgdesc="生态构建需要的不是某一方的单打独斗，而是人人行动起来，汇聚星火，产生燎原之势"
arch=('x86_64')
url="https://gitee.com/deepin-community-store/spark-store"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
#depends=('dpkg' 'qconf' 'dtkcore' 'dtkwidget' 'qt5-webengine' 'libnotify')
depends=('qt5-webengine' 'dtkwidget' 'libnotify')
#makedepends=('unzip' 'dpkg' 'qconf' 'dtkcore' 'dtkwidget' 'qt5-webengine' 'libnotify')
makedepends=('git' 'qt5-webengine' 'dtkwidget' 'libnotify')
backup=()
options=('!strip')
source_x86_64=("${url}attach_files/736583/download/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('SKIP')
sha256sums_x86_64=('4e49218a301d18fdeec07eb1f5c1800e644d62492765d59f78e6194ce6f09067')
source=("${pkgname}::git+${url}.git")

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout -b ${pkgver} ${pkgver}
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake ./${pkgname}-project.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    ar -x *.deb
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

    install -Dm0755 "${srcdir}/${pkgname}/build/src/${pkgname}" "${pkgdir}/opt/durapps/${pkgname}/bin/${pkgname}"
    install -dm0644 "${pkgdir}/usr/bin"
    ln -sf "/opt/durapps/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
