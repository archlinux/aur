# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=gdatafs
pkgver=1.0.2
pkgrel=2
pkgdesc='FUSE implementation that mounts Picasa, YouTube, and Google Docs on your filesystem'
url='http://gdatafs.sourceforge.net'
license=('GPL')
depends=('fuse' 'java-runtime')
changelog=ChangeLog
source=("https://sourceforge.net/projects/gdatafs/files/gdatafs $pkgver.tar.gz"
        'gdatafs.sh')
sha512sums=('172787c0d713ed7923786e296d9a8a01b425cc47c9b1612f7a133207f542b35986556d866998110a662bf7e3c9a1cb14da8cc6660ff0ad6f57f55d9bfcae1152'
            'ef6cd615e6f3436a954f4fa59ab75d9f008228f2deb0841f344d1693c6b5df510388b3d7771d49a11591ebeb03ffe175f30c7a3489011b645d38fa72d483d8f1')
arch=('any')

package() {
  cd "$srcdir"/gdatafs
  find . -type f -not \( -path "*/.svn/*" -o -path "*/.project" -o -path "*/.classpath" -o -path "*/src*/*" \) | sed -e 's/\.\///g' | while read file; do
    install -D "$file" "$pkgdir"/opt/gdatafs/"$file"
  done
  install -Dm755 "$srcdir"/gdatafs.sh "$pkgdir"/usr/bin/gdatafs
}
