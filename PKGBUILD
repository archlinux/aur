# Maintainer: Igor Mosyagin <c6h10o5@gmail.com>

pkgname=beamer-theme-liu-git
pkgver=r2.0d23bc0
pkgrel=1
pkgdesc="Beamer theme of Linköping University"
arch=(any)
url="http://git.lysator.liu.se/osund/liu-beamer"
license=("unknown")
makedepends=('git')
provides=("${pkgname}")
depends=("texlive-core")
source=("git+https://git.lysator.liu.se/osund/liu-beamer.git")
install="${pkgname}.install"
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/liu-beamer"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
  cd "$srcdir/liu-beamer"

  THEMEDIR=tex/latex/liu/liuslides
  mkdir -p ${TEXMFDIST}/${THEMEDIR}

  for tag in '' color font inner outer
  do
      install -m644 ${THEMEDIR}/beamer${tag}themeLiU.sty ${TEXMFDIST}/${THEMEDIR}/
  done

  MEDIADIR=tex/generic/images/logo/liu
  mkdir -p ${TEXMFDIST}/${MEDIADIR}
  for file in ${MEDIADIR}/*
  do
      install -m644 ${file} ${TEXMFDIST}/${file}
  done
}
