# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

_pkgname=fabric-carpet
pkgname=mc-fabric-carpet-git
pkgver=1.16.4.1.4.21.r2049.35715c93
pkgrel=1
pkgdesc="A mod for vanilla Minecraft that allows you to take full control of what matters"
arch=('any')
url="https://github.com/gnembon/fabric-carpet"
license=('LGPL')
makedepends=('gradle')
source=("git+https://github.com/gnembon/${_pkgname}.git")
md5sums=('SKIP') 

pkgver() {
  cd "$_pkgname"
  echo $(cat gradle.properties | grep 'minecraft_version' | cut -d'=' -f2 ).$(cat gradle.properties | grep 'mod_version' | cut -d'=' -f2 | sed 's/ //g').$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

build() {
  cd "$_pkgname"

  gradle build
}

package() {
  cd "$_pkgname"

  mkdir -p "${pkgdir}/usr/share/minecraft/"
  
  # please for the love of anything do not read the next 2 lines
  cp $(find build/libs -type f \( ! -iname '*dev*' ! -iname '*sources*' \)) \
     "${pkgdir}/usr/share/minecraft/${_pkgname}-$(cat gradle.properties | grep 'minecraft_version' | cut -d'=' -f2)-$(cat gradle.properties | grep 'mod_version' | cut -d'=' -f2 | sed 's/ //g').jar"
}

