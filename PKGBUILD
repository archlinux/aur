# Maintainer: Alessandro Rizzi <aur@rizzi.re>

pkgname=sub-edit-git
_pkgname=sub-edit
pkgver=20180428
pkgrel=1
pkgdesc="A very simple tool for synchronizing the subtitles of a movie while watching it"
arch=('i686' 'x86_64')
url="https://github.com/alessandrorizzi/sub-edit"
license=('AGPL3')
groups=()
depends=('java-runtime=8' 'sh')
makedepends=('git' 'sbt')
optdepends=()
provides=('sub-edit')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
  git+https://github.com/alessandrorizzi/sub-edit.git
  sub-edit.sh  
  sub-edit.desktop
  )
noextract=()
sha512sums=(
  'SKIP'
  c7db0deab43c89d33a815e973081c7b9890ce42a85c2590d083c1a2167572ca16c02f5485b31da578982de8e38b4262097d8545db1555ae6f5332a7bdc36bed4
  50e0cbc6f74d9e99ee2e33f85269bda91f358f9a485618b738ab849670d2891273e5679bb0f1533fce11b37cfc937d3310e732b15c01566a469f9323bf2fd727
  )

build() {
  cd "$srcdir"/"$_pkgname"
  sbt assembly
}

package() {
  cd "$srcdir"/"$_pkgname"
  mkdir -p "$pkgdir"/usr/{bin,share}
  mkdir -p "$pkgdir"/usr/share/"$_pkgname"
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/pixmaps  
  install -Dm644 target/scala-2.12/"$_pkgname".jar "$pkgdir"/usr/share/"$_pkgname"
  
  install -Dm644 "src/main/resources/icon.png" "$pkgdir"/usr/share/pixmaps/"$_pkgname-icon.png"  
  
  cd "$srcdir"
  install -Dm755 "$_pkgname.sh" "$pkgdir"/usr/bin
  install -Dm644 "$_pkgname.desktop" "$pkgdir"/usr/share/applications/
  
}
