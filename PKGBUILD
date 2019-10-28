# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=elastix
pkgver=5.0.0
pkgrel=1
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=()
depends=(
	'ann'
	'insight-toolkit>=5.0.1'
	'openjpeg2'
)
makedepends=('cmake')
optdepends=()
conflicts=('elastix-git' 'elastix-bin')
source=("https://github.com/SuperElastix/elastix/archive/${pkgver}.tar.gz")
sha256sums=('a377ae0307231bf70c474e87ebbf07d649faca211febf1c1d981a2039fcfcd0e')

prepare() {
	_build_dir="${srcdir}/${pkgname}-${pkgver}/build"

	mkdir "$_build_dir" || :
	cd "$_build_dir"

	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DCMAKE_CXX_FLAGS:STRING="--std=c++11" \
		-DBUILD_TESTING:BOOL=OFF \
		-DELASTIX_IMAGE_2D_PIXELTYPES:STRING="unsigned char;short;float" \
		-DELASTIX_IMAGE_3D_PIXELTYPES:STRING="unsigned char;short;float" \
		-DELASTIX_IMAGE_4D_PIXELTYPES:STRING="unsigned char;short;float" \
		-DELASTIX_IMAGE_DIMENSIONS:STRING="2;3;4" \
		-DELASTIX_USER_COMPONENT_DIRS:PATH="" \
		-DELASTIX_BUILD_EXECUTABLE:BOOL=ON \
		-DELASTIX_USE_OPENCL:BOOL=OFF \
		-DELASTIX_USE_OPENMP:BOOL=ON \
		-DELASTIX_USE_EIGEN:BOOL=OFF \
		-DUSE_ALL_COMPONENTS:BOOL=OFF \
		-DUSE_AdaGrad:BOOL=ON \
		-DUSE_AdaptiveStochasticGradientDescent:BOOL=ON \
		-DUSE_AdaptiveStochasticLBFGS:BOOL=ON \
		-DUSE_AdaptiveStochasticVarianceReducedGradient:BOOL=ON \
		-DUSE_AdvancedAffineTransformElastix:BOOL=ON \
		-DUSE_AdvancedBSplineTransform:BOOL=ON \
		-DUSE_AdvancedKappaStatisticMetric:BOOL=OFF \
		-DUSE_AdvancedMattesMutualInformationMetric:BOOL=ON \
		-DUSE_AdvancedMeanSquaresMetric:BOOL=ON \
		-DUSE_AdvancedNormalizedCorrelationMetric:BOOL=ON \
		-DUSE_AffineDTITransformElastix:BOOL=OFF \
		-DUSE_AffineLogStackTransform:BOOL=ON \
		-DUSE_AffineLogTransformElastix:BOOL=OFF \
		-DUSE_BSplineInterpolator:BOOL=ON \
		-DUSE_BSplineInterpolatorFloat:BOOL=OFF \
		-DUSE_BSplineResampleInterpolator:BOOL=ON \
		-DUSE_BSplineResampleInterpolatorFloat:BOOL=OFF \
		-DUSE_BSplineStackTransform:BOOL=ON \
		-DUSE_BSplineTransformWithDiffusion:BOOL=OFF \
		-DUSE_CMAEvolutionStrategy:BOOL=OFF \
		-DUSE_ConjugateGradient:BOOL=ON \
		-DUSE_ConjugateGradientFRPR:BOOL=OFF \
		-DUSE_CorrespondingPointsEuclideanDistanceMetric:BOOL=ON \
		-DUSE_DeformationFieldTransform:BOOL=ON \
		-DUSE_DisplacementMagnitudePenalty:BOOL=OFF \
		-DUSE_DistancePreservingRigidityPenalty:BOOL=ON \
		-DUSE_EulerStackTransform:BOOL=ON \
		-DUSE_EulerTransformElastix:BOOL=ON \
		-DUSE_FiniteDifferenceGradientDescent:BOOL=ON \
		-DUSE_FixedGenericPyramid:BOOL=ON \
		-DUSE_FixedRecursivePyramid:BOOL=ON \
		-DUSE_FixedShrinkingPyramid:BOOL=OFF \
		-DUSE_FixedSmoothingPyramid:BOOL=ON \
		-DUSE_FullSampler:BOOL=ON \
		-DUSE_FullSearch:BOOL=ON \
		-DUSE_GradientDifferenceMetric:BOOL=OFF \
		-DUSE_GridSampler:BOOL=ON \
		-DUSE_KNNGraphAlphaMutualInformationMetric:BOOL=ON \
		-DUSE_LinearInterpolator:BOOL=ON \
		-DUSE_LinearResampleInterpolator:BOOL=OFF \
		-DUSE_MissingStructurePenalty:BOOL=OFF \
		-DUSE_MovingGenericPyramid:BOOL=ON \
		-DUSE_MovingRecursivePyramid:BOOL=ON \
		-DUSE_MovingShrinkingPyramid:BOOL=OFF \
		-DUSE_MovingSmoothingPyramid:BOOL=ON \
		-DUSE_MultiBSplineTransformWithNormal:BOOL=OFF \
		-DUSE_MultiInputRandomCoordinateSampler:BOOL=ON \
		-DUSE_MultiMetricMultiResolutionRegistration:BOOL=ON \
		-DUSE_MultiResolutionRegistration:BOOL=ON \
		-DUSE_MultiResolutionRegistrationWithFeatures:BOOL=ON \
		-DUSE_MutualInformationHistogramMetric:BOOL=OFF \
		-DUSE_MyStandardResampler:BOOL=ON \
		-DUSE_NearestNeighborInterpolator:BOOL=OFF \
		-DUSE_NearestNeighborResampleInterpolator:BOOL=OFF \
		-DUSE_NormalizedGradientCorrelationMetric:BOOL=OFF \
		-DUSE_NormalizedMutualInformationMetric:BOOL=ON \
		-DUSE_OpenCLFixedGenericPyramid:BOOL=OFF \
		-DUSE_OpenCLMovingGenericPyramid:BOOL=OFF \
		-DUSE_OpenCLResampler:BOOL=OFF \
		-DUSE_PCAMetric:BOOL=ON \
		-DUSE_PCAMetric2:BOOL=ON \
		-DUSE_PatternIntensityMetric:BOOL=OFF \
		-DUSE_PolydataDummyPenalty:BOOL=OFF \
		-DUSE_Powell:BOOL=ON \
		-DUSE_PreconditionedGradientDescent:BOOL=OFF \
		-DUSE_PreconditionedStochasticGradientDescent:BOOL=ON \
		-DUSE_QuasiNewtonLBFGS:BOOL=ON \
		-DUSE_RSGDEachParameterApart:BOOL=OFF \
		-DUSE_RandomCoordinateSampler:BOOL=ON \
		-DUSE_RandomSampler:BOOL=ON \
		-DUSE_RandomSamplerSparseMask:BOOL=ON \
		-DUSE_RayCastInterpolator:BOOL=OFF \
		-DUSE_RayCastResampleInterpolator:BOOL=OFF \
		-DUSE_RecursiveBSplineTransform:BOOL=ON \
		-DUSE_ReducedDimensionBSplineInterpolator:BOOL=ON \
		-DUSE_ReducedDimensionBSplineResampleInterpolator:BOOL=ON \
		-DUSE_RegularStepGradientDescent:BOOL=ON \
		-DUSE_SimilarityTransformElastix:BOOL=OFF \
		-DUSE_Simplex:BOOL=OFF \
		-DUSE_SimultaneousPerturbation:BOOL=OFF \
		-DUSE_SplineKernelTransform:BOOL=ON \
		-DUSE_StandardGradientDescent:BOOL=ON \
		-DUSE_StatisticalShapePenalty:BOOL=OFF \
		-DUSE_SumOfPairwiseCorrelationCoefficientsMetric:BOOL=ON \
		-DUSE_SumSquaredTissueVolumeDifferenceMetric:BOOL=ON \
		-DUSE_TransformBendingEnergyPenalty:BOOL=ON \
		-DUSE_TransformRigidityPenalty:BOOL=ON \
		-DUSE_TranslationStackTransform:BOOL=ON \
		-DUSE_TranslationTransformElastix:BOOL=ON \
		-DUSE_VarianceOverLastDimensionMetric:BOOL=ON \
		-DUSE_ViolaWellsMutualInformationMetric:BOOL=OFF \
		-DUSE_WeightedCombinationTransformElastix:BOOL=OFF \
		..
}

build() {
	cd "$_build_dir"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	make install DESTDIR="${pkgdir}"

	cd ..

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
