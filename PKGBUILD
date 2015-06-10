pkgname=plv8-9.4-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="plv8js is a procedural language add-on for PostgreSQL"
url="https://code.google.com/p/plv8js/"
arch=('i686' 'x86_64')
license=('BSD new')
depends=('postgresql' 'v8-3.14')
makedepends=('git')
conflicts=('plv8js-git')
provides=('plv8')
source=("http://apt.postgresql.org/pub/repos/apt/pool/main/p/plv8/postgresql-9.4-plv8_1.4.2.ds-3~24.git9187996.pgdg14.10%2b1_amd64.deb")

package() {
  msg "Unpacking data.tar.xz (Ubuntu package files)"
  tar -xf data.tar.xz -C "${pkgdir}"

  cd "${pkgdir}"
  
  msg "Moving PostgreSQL Extension files to Arch's expected location"
  
  mkdir "${pkgdir}/usr/lib/postgresql/" || true
  mkdir "${pkgdir}/usr/share/postgresql/extension/" || true 

  mv "${pkgdir}/usr/lib/postgresql/9.4/lib/plv8.so" "${pkgdir}/usr/lib/postgresql/plv8.so"

  mv "${pkgdir}/usr/share/postgresql/9.4/extension/plv8--1.4.2.sql" "${pkgdir}/usr/share/postgresql/extension/"
  mv "${pkgdir}/usr/share/postgresql/9.4/extension/plv8.control" "${pkgdir}/usr/share/postgresql/extension/"

  msg "Fixing permissions differences between Ubuntu and Arch"
  msg2 "Directories"

  find ./ -type d -exec chmod -cR 755 "{}" \;

  msg2 "Files"
  find ./usr/{lib,share} -type f -exec chmod -cR 644 "{}" \;
}

md5sums=('496637c0925a4e3d42cf9cc6c42b9096')
