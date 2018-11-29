# $Id$
# Contributor: filip <fila pruda.com>

pkgname=esets
pkgver=4.5.11.0
pkgrel=1
pkgdesc="ESET Mail Security provides comercial Antivirus and Antispam"
arch=('x86_64')
license=('ESET')
url="http://www.eset.com/"
depends=('lib32-glibc')
backup=(etc/opt/eset/esets/esets.cfg)
install=esets.install
options=()

#fill your username and password
_username=
_password=

source=("http://$_username:$_password@download.eset.com/download/unix/esets.amd64.tgz.bin" "esets.service" "esets.sysusers")

md5sums=('dd13190fadb01e4637777afe7a3b3153' '8140d3acd8021b81adc67acf8a34ddc2' 'e68ea38f9bcaf5c3394051d04a6f4e65')



build() {

  tail -n +`awk '/^exit$/ { print NR + 1; exit }' "esets.amd64.tgz.bin"` "esets.amd64.tgz.bin" > "esets-$pkgver.amd64.tgz"
  tar xfz "esets-$pkgver.amd64.tgz"

}


package() {
    
  cd "$pkgdir"
  cpio -iumd --quiet < "$srcdir/epkg.cpio"
  
  rm -rf "etc/init.d"
  install -D -m644 "$srcdir/esets.service" "usr/lib/systemd/system/esets.service"
  
  install -D -m644 "$srcdir/esets.sysusers" "usr/lib/sysusers.d/esets.conf"

}
