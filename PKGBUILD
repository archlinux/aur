# Maintainer: Vasile Vilvoiu <vasi.vilvoiu@gmail.com>
pkgname=libecbor
pkgver=1.0.1
pkgrel=1
pkgdesc="CBOR library for desktop and embedded applications"
arch=('x86_64')
url="https://github.com/rimio/libecbor"
license=('MIT')
depends=()
makedepends=('cmake' 'gcc')
checkdepends=()
optdepends=()
backup=()
options=(staticlibs)
source=("https://github.com/rimio/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("1b851865ee934362cae9c03578810db7")

prepare() {
    PATCH="
--- a/src/ecbor-describe/ecbor_describe.c
+++ b/src/ecbor-describe/ecbor_describe.c
@@ -62,7 +62,7 @@ print_ecbor_item (ecbor_item_t *item, unsigned int level, char *prefix)
   unsigned int i;
 
   for(i = 0; i < level * 2; i ++) putchar(' ');
-  printf (prefix);
+  printf (\"%s\", prefix);
 
   mt = ecbor_get_type (item);
   switch (mt) {
   "

    cd "$pkgname-$pkgver"
    echo "${PATCH}" | patch --forward --strip=1
}

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
