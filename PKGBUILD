# Maintainer: Michael Picht <mipi@fsfe.org> 
 
pkgname=crema
pkgver=2.0
pkgrel=1
pkgdesc="Manage (remote) custom repositories"          
arch=(any) 
url="https://gitlab.com/mipimipi/$pkgname"  
license=(GPL3) 
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")         
md5sums=(SKIP) 
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
depends=( 
    binutils 
    devtools
    rsync 
) 
makedepends=(
    make
    pandoc
) 
optdepends=(gnupg) 
provides=(crema)
conflicts=(crema-git)
 
# aurutils 
conflicts+=( 
    aurutils 
    aurutils-git 
) 
depends+=( 
    git 
    jq 
    pacutils 
    parallel 
    wget 
) 
makedepends+=(m4)
optdepends+=( 
    "bash-completion: bash completion" 
    "devtools: aur-chroot" 
    "vifm: build file interaction" 
) 
 
build() { 
    cd "${pkgname}-${pkgver}"
    make

    # aurutils 
    cd aurutils
    make DESTDIR="$pkgdir" 
} 
 
package() { 
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install 
 
  # aurutils 
  cd aurutils 
  make DESTDIR="$pkgdir" install 
} 
