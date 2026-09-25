# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-ctf-party
_gemname=ctf-party
pkgver=5.0.0
pkgrel=1
pkgdesc='A CLI tool & library to enhance and speed up script/exploit writing with string conversion/manipulation.'
arch=('x86_64')
url='https://noraj.github.io/ctf-party/'
license=('MIT')
depends=('ruby')
makedepends=('git' 'ruby-bundler')
options=(!emptydirs)
source=("https://github.com/noraj/$_gemname/archive/v$pkgver.tar.gz")
provides=('ctf-party')
conflicts=('ctf-party')
noextract=("$_gemname-$pkgver.gem")
b2sums=('439d009f65f005c2a05dd7e7b4d7d0bb443c014f28d80be6ad2f93fc0e377408cbfdc1df18f4b6de5189a9e2fec7a77a578134f01a10326d588df12a9905b452')
install="$_gemname.install"

package() {
  cd "$_gemname-$pkgver"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$_gemname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$_gemname" docs/**/*.md *.md

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$_gemname/LICENSE"

  rm -rf .github/ docs/ test/ .* Dockerfile Rakefile *.md LICENSE docker-compose.yml

  cp --no-preserve=ownership -a * "$pkgdir/usr/share/$_gemname/"

  # need to cd to load .bundle/
  cat > "$pkgdir/usr/bin/$_gemname" << EOF
#!/bin/sh
cd /usr/share/$_gemname
exec bundle exec ruby bin/$_gemname "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/*
}

