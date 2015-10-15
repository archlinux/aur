# Author: Moligaloo <Moligaloo@gmail.com>
# Maintainer: Iven Hsu <ivenvd@gmail.com>
# Contributor: Yangtse <yangtsesu@gmail.com>
# Contributor: Vehiclee <>
# Contributor: abf <zouxiaomingabf@gmail.com>

pkgname=qsanguoshav2-git
_gitname=QSanguosha-v2
pkgver=1.bc669c2
pkgrel=2
pkgdesc="An open source online version of the famous board game Sanguosha"
arch=('i686' 'x86_64')
url="https://github.com/Mogara/QSanguosha-v2"
license=('GPL3')
depends=('qt5-base' 'qt5-quick1' 'phonon' 'plib' 'lua' 'fmodex')
makedepends=('git' 'swig' 'qtchooser')
conflicts=(qsanguosha)
provides=(qsanguosha)
options=(!strip)
source=('git://github.com/Mogara/QSanguosha-v2.git' 'qsanguosha' 'qsanguosha.desktop' 'sgs.png')
sha224sums=(
	'SKIP'
	'4d9aa3479c91b93bb780487191937621d84448a9897bcc0628b73eb1'
	'8d31f15f9fbf50cfa33e23947855a4f0cdc1af0ab448cdc39bf0a0de'
	'00a75a779dd66a6c89e42599ef283436aa9ca1df44c73baf41369361'
)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd ${srcdir}/${_gitname}/
	qmake .
	make
}

package() {
    cd ${srcdir}/${_gitname}
    mkdir -p ${pkgdir}/opt/qsanguosha
    cp -R {lib,font,doc,audio,diy,etc,extension-doc,QSanguosha,qt_zh_CN.qm,image,lang,scenarios,lua,sanguosha.qm,skins} ${pkgdir}/opt/qsanguosha/
    install -D -m755 ${srcdir}/qsanguosha "${pkgdir}/usr/bin/qsanguosha"
    install -D -m644 ${srcdir}/qsanguosha.desktop "${pkgdir}/usr/share/applications/qsanguosha.desktop"
    install -D -m644 ${srcdir}/sgs.png "${pkgdir}/usr/share/pixmaps/QSanguosha.png"
}
