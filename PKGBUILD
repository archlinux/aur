#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=('jcdk-classic' 'jcdk-classic-doc')
pkgver=3.0.5u1
pkgrel=1
arch=('any')
url="https://www.oracle.com/java/java-card.html"
license=('custom')
makedepends=('msitools')
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/java_card_kit/3.0.5/java_card_kit-classic-3_0_5-u1-win32-do-b35-15_may_2017.msi")
md5sums=('bf7e66cdc37aa1c022d8cb2b38a1443c')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=accept-securebackup-cookie -o %o %u')

prepare() {
	msiextract java_card_kit-classic-3_0_5-u1-win32-do-b35-15_may_2017.msi
}

package_jcdk-classic() {
	pkgdesc="Java Card Classic Development Kit"
	depends=('java-environment>=7')

	cd "Program Files/Oracle/Java Card Development Kit 3.0.5dev"
	# shellcheck disable=SC2154
	install -d "$pkgdir/usr/lib/$pkgbase"
	for dir in api_export_files lib ; do
		cp -a "$dir" "$pkgdir/usr/lib/$pkgbase"
	done
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgbase" legal/*
}

package_jcdk-classic-doc() {
	pkgdesc="Java Card Classic Development Kit Documentation"

	cd "Program Files/Oracle/Java Card Development Kit 3.0.5dev"
	install -d "$pkgdir/usr/share/doc/$pkgbase"
	for dir in docs/* ; do
		cp -a "$dir" "$pkgdir/usr/share/doc/$pkgbase"
	done
}
