# Maintainer: diaowinner <diaowinner@gmail.com>
# Maintainer: KreativeKorp <support@kreativekorp.com>
pkgname=bitsnpicas-git
pkgver=2.0.2.r325.7700757
pkgrel=1
pkgdesc="Kreative BitsNPicas, with MapEdit and KeyEdit, in the latest snapshot version"
arch=("any")
url="https://github.com/kreativekorp/bitsnpicas"
license=("MPL")
depends=("java-runtime" "hicolor-icon-theme" "xdg-utils" "bash" "libxrender" "libxtst" "fontconfig" "xorg-mkfontscale" "ttf-font")
makedepends=("jdk-openjdk" "make" "git")
provides=("bitsnpicas")
source=(
"${pkgname}::git+https://github.com/kreativekorp/bitsnpicas.git#branch=master"
"bitsnpicas" "bitsnpicas.desktop"
"mapedit" "mapedit.desktop"
"keyedit" "keyedit.desktop"
)
sha256sums=("SKIP"
"c883633d8588c94eb30fee7ded3b0115ab69d8e8d43fbbe4e1ebec21816b6bc8" "0a2fde77db8fb7008e19f978dbcc5f696ad9ae28884a8528e550742a2fc8964c"
"0c0e0ffb55f39453e1edbfa7c528d5a384ea424dc323219699a8f6b6f8465c24" "45ca46408b2a4fdd0e0a8af4608dbeb794a7e2a9c76da9e4c5ae7808c6d8317c"
"9edaf143ad281c1a6b5ba27df2cf3ea56887c3a71caae315bb678edb4d4d54c9" "69e786b235a81c9532e186bc270ea5b71c639b17140d76ef8cc32c7a5aea7665"
)

pkgver(){
cd "${srcdir}/${pkgname}"
printf "2.0.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd "${srcdir}/${pkgname}/main/java/BitsNPicas"
make clean bin BitsNPicas.jar MapEdit.jar KeyEdit.jar
}

package() {
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/BitsNPicas.jar" "${pkgdir}/usr/lib/bitsnpicas.jar"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/MapEdit.jar" "${pkgdir}/usr/lib/mapedit.jar"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/KeyEdit.jar" "${pkgdir}/usr/lib/keyedit.jar"
  # install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/dep/KSFL.jar" "${pkgdir}/usr/lib/KSFL.jar"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/dep/ual.jar" "${pkgdir}/usr/lib/ual.jar"
  install -D -m755 -T "${srcdir}/bitsnpicas" "${pkgdir}/usr/bin/bitsnpicas"
  install -D -m755 -T "${srcdir}/keyedit" "${pkgdir}/usr/bin/keyedit"
  install -D -m755 -T "${srcdir}/mapedit" "${pkgdir}/usr/bin/mapedit"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/dep/bitsnpicas.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/bitsnpicas.png"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/dep/kbnp-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bitsnpicas.png"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/dep/mapedit-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mapedit.png"
  install -D -m644 -T "${srcdir}/${pkgname}/main/java/BitsNPicas/dep/keyedit-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/keyedit.png"
  install -D -m644 -T "${srcdir}/bitsnpicas.desktop" "${pkgdir}/usr/share/applications/bitsnpicas.desktop"
  install -D -m644 -T "${srcdir}/mapedit.desktop" "${pkgdir}/usr/share/applications/mapedit.desktop"
  install -D -m644 -T "${srcdir}/keyedit.desktop" "${pkgdir}/usr/share/applications/keyedit.desktop"

  # That should work...
  mkdir ${pkgdir}/usr/local
  mkdir ${pkgdir}/usr/local/lib
  mkdir ${pkgdir}/usr/local/bin
  ln -sf ${pkgdir}/usr/lib/bitsnpicas.jar ${pkgdir}/usr/local/lib/bitsnpicas.jar
  ln -sf ${pkgdir}/usr/lib/mapedit.jar ${pkgdir}/usr/local/lib/mapedit.jar
  ln -sf ${pkgdir}/usr/lib/keyedit.jar ${pkgdir}/usr/local/lib/keyedit.jar
  # ln -sf ${pkgdir}/usr/lib/KSFL.jar ${pkgdir}/usr/local/lib/KSFL.jar
  ln -sf ${pkgdir}/usr/lib/ual.jar ${pkgdir}/usr/local/lib/ual.jar
  ln -sf ${pkgdir}/usr/bin/bitsnpicas ${pkgdir}/usr/local/bin/bitsnpicas
  ln -sf ${pkgdir}/usr/bin/keyedit ${pkgdir}/usr/local/bin/keyedit
  ln -sf ${pkgdir}/usr/bin/mapedit ${pkgdir}/usr/local/bin/mapedit
}
