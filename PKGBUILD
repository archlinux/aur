# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fisherman
pkgver=1.5.0
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=('any')
url="http://fisherman.sh/"
license=('MIT')
depends=('fish>=2.2.0' 'git')
optdepends=()
makedepends=('git')
conflicts=('fisherman-git')
install=fisherman-git.install
source=(
  "https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
  "config-fisherman.fish"
)
sha512sums=('SKIP'
            '5ba23cd8a2a08153e3d992cd4e9a717f4016af447b5578c26053a002de5cf2276fe1f01c704744fdb50d06f20e89fe42e2ccf9e1e99a12850b46b35c684d05dd')

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  fisherpath="${sharepath}/fisherman"
  # config for sourcing Fisherman from the user's fish config
  install -Dm 644 config-fisherman.fish "${fishpath}/config-fisherman.fish"
  cd "${pkgname}-${pkgver}"
  # this will be included from the config-fisherman.fish
  install -Dm 644 config.fish "${fisherpath}/config.fish"
  # completions
  install -Dt "${fisherpath}/completions" completions/*
  # functions
  install -Dt "${fisherpath}/functions" functions/*
  # man pages, README and LICENSE
  install -Dt "${sharepath}/man/man1" man/man1/*
  install -Dm 644 LICENSE "${sharepath}/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
