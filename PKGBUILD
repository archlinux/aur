# Author: Julius Michaelis <lls@liftm.de> 
pkgname=list-listening-sockets
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool for listing listening sockets"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/jcaesar/lls"
license=("MIT")
makedepends=("rust")
provides=("list-listening-sockets")
source=("$pkgname-$pkgver.tgz::https://crates.io/api/v1/crates/lls/0.1.0/download")
sha256sums=("eeab49c1c2b07156fcbf814868aa39d00947a9dc642924bf4ac27f2569012ff4")

prepare() {                                                                         
	cd lls-${pkgver}                                                          
	cargo fetch --locked --target $CARCH-unknown-linux-gnu                            
}                                                                                   

build() {                                                                           
	cd lls-${pkgver}                                                          
	cargo build --release --frozen                                                    
}                                                                                   

check() {                                                                           
	cd lls-${pkgver}                                                          
	cargo test --frozen                                                               
}

package() {                                                                         
	cd lls-${pkgver}                                                          
	install -Dm 755 target/release/lls -t "${pkgdir}/usr/bin"                        
}   
