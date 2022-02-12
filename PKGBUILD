# Maintainer: HitCoder <hitcoder9768@gmail.com>
pkgname=openutau-git
pkgver=0.0.595
pkgrel=1
epoch=
pkgdesc="An open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('dotnet-host' 'dotnet-runtime-3.1' 'dotnet-targeting-pack-3.1' 'dotnet-sdk-3.1' 'fuse2' 'fuse3' 'fuse-common')
source=("git+https://github.com/stakira/OpenUtau.git"
        "OpenUtau-git.desktop")
sha256sums=('SKIP'
            '6c80a52ee0d8892510d6e26c998e773c99cb3459064162839913e9aa3bf9c381')

build() {
	cd "$srcdir"/OpenUtau
	dotnet restore OpenUtau
	dotnet build OpenUtau
}

package() {

    # Copy libraries
    install -Dm755 "$srcdir"/OpenUtau/OpenUtau/bin/Debug/netcoreapp3.1/OpenUtau \
      "$pkgdir"/usr/lib/$pkgname/OpenUtau
	cp -r "$srcdir"/OpenUtau/OpenUtau/bin/Debug/netcoreapp3.1/* "$pkgdir"/usr/lib/$pkgname/

    # Wrapper
    echo "#!/bin/sh" > "$srcdir"/openutau
    echo "exec /usr/lib/$pkgname/OpenUtau" >> "$srcdir"/openutau
    install -Dm755 "$srcdir"/openutau "$pkgdir"/usr/bin/openutau

	# Icon
	install -Dm644 "$srcdir"/OpenUtau/Logo/openutau.svg "$pkgdir"/usr/share/pixmaps/openutau.svg

	# Desktop file
	install -Dm644 "$srcdir"/OpenUtau-git.desktop "$pkgdir"/usr/share/applications/OpenUtau-git.desktop
}
