# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=asis
pkgver=2017
pkgrel=2
pkgdesc="Allows Ada programs access to the syntactic and semantic structure of source code. Also provides extra tools such as gnatpp."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools
license=(GPL)
groups=(gcc-ada)

depends=(gcc-ada gnat_util gnatcoll)

provides=($pkgname)
conflicts=($pkgname)

source=(http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deecffb
        Makefile-patch
        Makefile.stub-patch
        a4g-a_elists.ads-patch
        a4g-asis_tables.ads-patch
        a4g-contt-ut.adb-patch
        a4g-contt.adb-patch
        a4g-contt.ads-patch
        a4g-defaults.ads-patch
        asis-data_decomposition-set_get.ads-patch
        asis-extensions-strings.adb-patch
        asis.gpr-patch
        asis_ui-compiler_options.adb-patch
        asis_ui-global_state.adb-patch
        asis_ui-source_table.adb-patch
        gnatcheck-asis_utilities.adb-patch
        gnatcheck-categories.adb-patch
        gnatcheck-diagnoses_old.adb-patch
        gnatcheck-name_dictionary.adb-patch
        gnatcheck-rules-custom_1.adb-patch
        gnatcheck-rules-rule_table.adb-patch
        gnatcheck-rules-rule_table.ads-patch
        gnatcheck-traversal_stack.adb-patch
        gnatelim-closure.adb-patch
        metrics-source_table.adb-patch)



sha1sums=('369101e6b0d9e777b9bcae821ddb68567138a95f'
          '20452ee87ed5b7a1c10f207e098f29f68f2d18b8'
          '60137197ec26eee43fea570a6fc97563437c1c84'
          'c30f18654d474029119a81bc30d48b8b78c7454f'
          'cab68c6c9890242f6f547d1a7a6b28909724f494'
          '17e195a0f3283e7cb2e314a2a7fbee3d3e16bf4f'
          'ca5270f9426f96aef4d39017e116bf07c87d18eb'
          '900aab3b77f0cb6ab52b1430c4cdb7dc0884adc2'
          'e4fa897994072830844b1001f4cf018c4b7ef045'
          'a4c96d9f7eba3bda7011f1b8f6fcc5560b5a7305'
          '444099ac59d93e0ac380edc88f581add6fa37e0d'
          'f47413c62cb45a6cb608d3ce0e09eb4430a8294b'
          '6a90ea0eb4c3531b8e93b3026a4d882cd780ba1c'
          '138594104b6ccf92449d5d673924b0ae35e64942'
          '914921f22db384439d0ba0eb5022670fd4299cb6'
          '22c177723b7e31de47c043d7519c7f82153b41df'
          'd5bc78cf44e743be262218c8eac7d84d76ad6633'
          '0cd3ed84e7ddcb739305927b6a8306a2ca1e2d78'
          'e0efa9a3aa89a65717cbfec6b1efd41bd574b3ba'
          'a73d7389e09fdb80d17560f29d2e34e3ca01c0b5'
          '0aabd9e44ded38630771539ae883dbb1a4b020a4'
          '5eefb9a65af42809c9d02c872a8bd75745ce6c88'
          '6173adc9dbb5095f58e49eda81beaf63f5fa452e'
          '841d3de56687297d4c561b9c882460a3624b0d82'
          '0f0c91d8fcd0333eb6ddd9b704bf656bf59cb444')


prepare()
{
    WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

    sed -i  -e 's|OPSYS|ASISOPSYS|g'              \
            -e 's|(prefix)|(DESTDIR)$(prefix)|g' \
            ${WRKSRC}/Makefile                    \
            ${WRKSRC}/Makefile.stub               \
            ${WRKSRC}/common.gpr

    rm -rf  ${WRKSRC}/gnat/*

    cd $WRKSRC
    patch -p1 -i ../Makefile-patch
    patch -p1 -i ../Makefile.stub-patch
    patch -p1 -i ../a4g-a_elists.ads-patch
    patch -p1 -i ../a4g-asis_tables.ads-patch
    patch -p1 -i ../a4g-contt-ut.adb-patch
    patch -p1 -i ../a4g-contt.adb-patch
    patch -p1 -i ../a4g-contt.ads-patch
    patch -p1 -i ../a4g-defaults.ads-patch
    patch -p1 -i ../asis-data_decomposition-set_get.ads-patch
    patch -p1 -i ../asis-extensions-strings.adb-patch
    patch -p1 -i ../asis.gpr-patch
    patch -p1 -i ../asis_ui-compiler_options.adb-patch
    patch -p1 -i ../asis_ui-global_state.adb-patch
    patch -p1 -i ../asis_ui-source_table.adb-patch
    patch -p1 -i ../gnatcheck-asis_utilities.adb-patch
    patch -p1 -i ../gnatcheck-categories.adb-patch
    patch -p1 -i ../gnatcheck-diagnoses_old.adb-patch
    patch -p1 -i ../gnatcheck-name_dictionary.adb-patch
    patch -p1 -i ../gnatcheck-rules-custom_1.adb-patch
    patch -p1 -i ../gnatcheck-rules-rule_table.adb-patch
    patch -p1 -i ../gnatcheck-rules-rule_table.ads-patch
    patch -p1 -i ../gnatcheck-traversal_stack.adb-patch
    patch -p1 -i ../gnatelim-closure.adb-patch
    patch -p1 -i ../metrics-source_table.adb-patch
}



build() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    make all
    make tools
}

    

package() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    PREFIX=/usr  make install       prefix=${pkgdir}/usr
    PREFIX=/usr  make install-tools prefix=${pkgdir}/usr
}
