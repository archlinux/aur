# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=gdatafs
pkgver=1.0.2
pkgrel=2
pkgdesc='FUSE implementation that mounts Picasa, YouTube, and Google Docs on your filesystem'
url='http://gdatafs.sourceforge.net'
license='GPL'
depends=('fuse' 'java-runtime')
changelog=ChangeLog
source=(http://sourceforge.net/projects/gdatafs/files/gdatafs%20$pkgver.tar.gz
        gdatafs.sh)
md5sums=('77e5207f1b2cfb72307087ebceb7b801'
         '76bcee2cd35ec0c78e3a3985dc600882')
arch=('any')
build() {
	pushd "$srcdir"/gdatafs || return 1
		find . -type f | sed -e 's/\.\///g' | while read file; do
			if [ $(echo "$file" | grep '.svn' -i -c) = 0 -a $(echo "$file" | grep '.project' -i -c) = 0 -a $(echo "$file" | grep '.classpath' -i -c) = 0 -a $(echo "$file" | grep 'src' -i -c) = 0 ]; then
				install -D "$file" "$pkgdir"/opt/gdatafs/"$file" || return 1
			fi || return 1
		done || return 1
		install -Dm755 "$srcdir"/gdatafs.sh "$pkgdir"/usr/bin/gdatafs || return 1
	popd || return 1
}
