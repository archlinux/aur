pkgname=glitter-git
pkgver=master
pkgrel=1
pkgdesc='Git repositories management tool written in bash'
arch=('any')
url='https://gitlab.com/lordinvader/glitter'
depends=('bash')
source=('git+https://gitlab.com/lordinvader/glitter')
sha256sums=('SKIP')

build() {
	cd $srcdir/glitter
	mkdir build
	
	printf "#!/bin/bash\n\nconfdir=$HOME/.config/glitter\n" > build/glitter
	cat glitter.sh >> build/glitter

	cp bash_completion.sh build
	bash build/glitter autocomplete > build/glitter_autocomplete.sh
	rm build/bash_completion.sh
}

package() {
	  mkdir -p $pkgdir/usr/bin
	  cp $srcdir/glitter/build/glitter $pkgdir/usr/bin/glitter
	  chmod +x $pkgdir/usr/bin/glitter

	  mkdir -p $pkgdir/etc/profile.d
	  cp $srcdir/glitter/build/glitter_autocomplete.sh $pkgdir/etc/profile.d
}